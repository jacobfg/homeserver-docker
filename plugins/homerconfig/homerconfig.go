// Package homerconfig selects a Homer configuration after ForwardAuth.
package homerconfig

import (
	"context"
	"net/http"
	"net/url"
	"path"
	"regexp"
	"strings"
)

const defaultPath = "/assets/config.yml"

// Config deliberately exposes no user-controlled path templates.
type Config struct {
	Enabled bool `json:"enabled,omitempty"`
}

func CreateConfig() *Config { return &Config{Enabled: true} }

type middleware struct{ next http.Handler }

func New(_ context.Context, next http.Handler, config *Config, _ string) (http.Handler, error) {
	if !config.Enabled {
		return next, nil
	}
	return &middleware{next: next}, nil
}

var username = regexp.MustCompile(`^[A-Za-z0-9_@.-]+$`)
var personalPath = regexp.MustCompile(`^/assets/config\..*\.yml(?:/.*)?$`)

// Detect alternate encodings before allowing an ordinary asset request through.
func protectedPath(p string) bool {
	for {
		clean := path.Clean("/" + strings.TrimPrefix(p, "/"))
		if clean == defaultPath || personalPath.MatchString(clean) {
			return true
		}
		decoded, err := url.PathUnescape(p)
		if err != nil || decoded == p {
			return false
		}
		p = decoded
	}
}

func (m *middleware) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != defaultPath {
		if protectedPath(r.URL.Path) {
			w.Header().Set("Cache-Control", "private, no-store")
			http.NotFound(w, r)
			return
		}
		m.next.ServeHTTP(w, r)
		return
	}
	w.Header().Set("Cache-Control", "private, no-store")
	if r.Method != http.MethodGet && r.Method != http.MethodHead {
		w.Header().Set("Allow", "GET, HEAD")
		http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
		return
	}
	users := r.Header.Values("Remote-User")
	if len(users) == 0 || (len(users) == 1 && users[0] == "") {
		http.Error(w, "authentication required", http.StatusUnauthorized)
		return
	}
	if len(users) != 1 || !username.MatchString(users[0]) || users[0] == "." || users[0] == ".." {
		http.Error(w, "invalid identity", http.StatusForbidden)
		return
	}
	request := r.Clone(r.Context())
	for _, h := range []string{"If-Match", "If-None-Match", "If-Modified-Since", "If-Unmodified-Since", "If-Range", "Range"} {
		request.Header.Del(h)
	}
	request.URL.Path = "/assets/config." + users[0] + ".yml"
	request.URL.RawPath = ""
	request.RequestURI = request.URL.RequestURI()
	first := newResponse(w, true)
	m.next.ServeHTTP(first, request)
	first.finish()
	if first.status != http.StatusNotFound {
		return
	}
	// Re-enter only the downstream handler, not authentication or this middleware.
	fallback := request.Clone(request.Context())
	fallback.URL.Path = defaultPath
	fallback.RequestURI = fallback.URL.RequestURI()
	second := newResponse(w, false)
	m.next.ServeHTTP(second, fallback)
	second.finish()
}

// response isolates attempt headers and discards only the first 404. Other
// responses stream without buffering the configuration in memory.
type response struct {
	target     http.ResponseWriter
	header     http.Header
	status     int
	discard404 bool
}

func newResponse(w http.ResponseWriter, discard bool) *response {
	return &response{target: w, header: w.Header().Clone(), discard404: discard}
}
func (w *response) Header() http.Header { return w.header }
func (w *response) WriteHeader(status int) {
	if w.status != 0 || status < 200 {
		return
	}
	w.status = status
	if w.discard404 && status == http.StatusNotFound {
		return
	}
	for key := range w.target.Header() {
		delete(w.target.Header(), key)
	}
	for key, values := range w.header {
		w.target.Header()[key] = append([]string(nil), values...)
	}
	w.target.Header().Set("Cache-Control", "private, no-store")
	w.target.Header().Del("ETag")
	w.target.Header().Del("Last-Modified")
	w.target.WriteHeader(status)
}
func (w *response) Write(b []byte) (int, error) {
	w.finish()
	if w.discard404 && w.status == http.StatusNotFound {
		return len(b), nil
	}
	return w.target.Write(b)
}
func (w *response) finish() {
	if w.status == 0 {
		w.WriteHeader(http.StatusOK)
	}
}
func (w *response) Flush() {
	w.finish()
	if w.discard404 && w.status == http.StatusNotFound {
		return
	}
	if flusher, ok := w.target.(http.Flusher); ok {
		flusher.Flush()
	}
}
