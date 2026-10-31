package homerconfig

import (
	"context"
	"fmt"
	"net/http"
	"net/http/httptest"
	"reflect"
	"sync"
	"testing"
)

func handler(next http.HandlerFunc) http.Handler {
	h, err := New(context.Background(), next, CreateConfig(), "test")
	if err != nil {
		panic(err)
	}
	return h
}

func TestSelectionAndFallback(t *testing.T) {
	for _, method := range []string{"GET", "HEAD"} {
		for _, firstStatus := range []int{200, 404, 403, 500, 502} {
			for _, fallbackStatus := range []int{200, 403, 404, 500} {
				t.Run(fmt.Sprintf("%s/%d/%d", method, firstStatus, fallbackStatus), func(t *testing.T) {
					var paths []string
					h := handler(func(w http.ResponseWriter, r *http.Request) {
						paths = append(paths, r.URL.Path)
						if r.Method != method || r.URL.RawQuery != "v=1" || r.URL.RawPath != "" || r.RequestURI != r.URL.RequestURI() {
							t.Error("request metadata changed incorrectly")
						}
						for _, key := range []string{"Range", "If-Range", "If-Match", "If-None-Match", "If-Modified-Since", "If-Unmodified-Since"} {
							if r.Header.Get(key) != "" {
								t.Errorf("forwarded %s", key)
							}
						}
						status := firstStatus
						if len(paths) == 2 {
							status = fallbackStatus
						} else {
							w.Header().Set("X-First", "first")
						}
						w.Header().Set("Cache-Control", "public, max-age=3600")
						w.Header().Set("ETag", "test")
						w.WriteHeader(status)
						if method == "GET" {
							fmt.Fprintf(w, "%s:%d", r.URL.Path, status)
						}
					})
					r := httptest.NewRequest(method, defaultPath+"?v=1", nil)
					r.Header.Set("Remote-User", "Alice@example.org")
					for _, key := range []string{"Range", "If-Range", "If-Match", "If-None-Match", "If-Modified-Since", "If-Unmodified-Since"} {
						r.Header.Set(key, "test")
					}
					w := httptest.NewRecorder()
					h.ServeHTTP(w, r)
					wantPaths := []string{"/assets/config.Alice@example.org.yml"}
					wantStatus := firstStatus
					if firstStatus == 403 || firstStatus == 404 {
						wantPaths = append(wantPaths, defaultPath)
						wantStatus = fallbackStatus
						if w.Header().Get("X-First") != "" {
							t.Error("leaked discarded response header")
						}
					}
					if !reflect.DeepEqual(paths, wantPaths) || w.Code != wantStatus {
						t.Fatalf("paths=%v status=%d", paths, w.Code)
					}
					wantBody := ""
					if method == "GET" {
						wantBody = fmt.Sprintf("%s:%d", wantPaths[len(wantPaths)-1], wantStatus)
					}
					if w.Body.String() != wantBody {
						t.Errorf("body=%q", w.Body.String())
					}
					if w.Header().Get("Cache-Control") != "private, no-store" || w.Header().Get("ETag") != "" {
						t.Error("cache policy")
					}
					if r.URL.Path != defaultPath || r.Header.Get("Range") != "test" {
						t.Error("mutated original request")
					}
				})
			}
		}
	}
}

func TestAccessBoundaries(t *testing.T) {
	for _, tc := range []struct {
		path, method string
		users        []string
		status       int
	}{
		{defaultPath, "GET", nil, 401},
		{defaultPath, "GET", []string{""}, 401},
		{defaultPath, "GET", []string{"alice", "bob"}, 403},
		{defaultPath, "GET", []string{"../bob"}, 403},
		{defaultPath, "GET", []string{".."}, 403},
		{defaultPath, "GET", []string{"alice,bob"}, 403},
		{defaultPath, "GET", []string{"a%2fb"}, 403},
		{defaultPath, "POST", []string{"alice"}, 405},
		{"/assets/config.bob.yml", "GET", []string{"alice"}, 404},
		{"/assets/config%2ebob.yml", "GET", []string{"alice"}, 404},
		{"/assets/config%252ebob.yml", "GET", []string{"alice"}, 404},
		{"/assets/sub/../config.bob.yml", "GET", []string{"alice"}, 404},
		{"/assets/config.bob.yml/extra", "GET", []string{"alice"}, 404},
		{"/assets//config.yml", "GET", []string{"alice"}, 404},
	} {
		t.Run(tc.path+tc.method+fmt.Sprint(tc.users), func(t *testing.T) {
			h := handler(func(http.ResponseWriter, *http.Request) { t.Fatal("backend must not be called") })
			r := httptest.NewRequest(tc.method, tc.path, nil)
			r.Header["Remote-User"] = tc.users
			w := httptest.NewRecorder()
			h.ServeHTTP(w, r)
			if w.Code != tc.status {
				t.Fatalf("status=%d want=%d", w.Code, tc.status)
			}
		})
	}
}

func TestOrdinaryAssets(t *testing.T) {
	for _, p := range []string{"/", "/assets/config.yaml", "/assets/logo.png", "/assets/page2.yml", "/services/example"} {
		r := httptest.NewRequest("GET", p, nil)
		w := httptest.NewRecorder()
		handler(func(w http.ResponseWriter, got *http.Request) {
			if got != r {
				t.Error("ordinary request cloned")
			}
			w.Header().Set("Cache-Control", "public")
			w.WriteHeader(204)
		}).ServeHTTP(w, r)
		if w.Code != 204 || w.Header().Get("Cache-Control") != "public" {
			t.Error("ordinary response modified")
		}
	}
}

func TestConcurrentUsers(t *testing.T) {
	h := handler(func(w http.ResponseWriter, r *http.Request) { fmt.Fprint(w, r.URL.Path) })
	var wg sync.WaitGroup
	for i := 0; i < 50; i++ {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			user := fmt.Sprintf("user%d", i)
			r := httptest.NewRequest("GET", defaultPath, nil)
			r.Header.Set("Remote-User", user)
			w := httptest.NewRecorder()
			h.ServeHTTP(w, r)
			if w.Body.String() != "/assets/config."+user+".yml" {
				t.Error("cross-user response")
			}
		}(i)
	}
	wg.Wait()
}
