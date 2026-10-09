#!/bin/bash
# Host-side cgroup v2 sampler. No commands are executed inside containers.
# Usage: bash monitor-container-resources.bash [seconds=43200] [interval=10] [output-dir] [container ...]
# Report during collection: bash monitor-container-resources.bash --summarize OUTPUT_DIR
set -u

summarize() {
    local directory=$1
    awk -F, '
    NR == 1 { next }
    {
        key=$3 "|" $4 "|" $5
        name[key]=$3; id[key]=substr($4,1,12); started[key]=$5; restarts[key]=$6
        count[key]++
        if ($13+0 > mem[key]) mem[key]=$13+0
        if ($14 != "NA" && $14+0 > life[key]) life[key]=$14+0
        if ($16 != "NA" && $16+0 > swap[key]) swap[key]=$16+0
        if ($18+0 > pids[key]) pids[key]=$18+0
        cpuLimit[key]=$12; memLimit[key]=$15
        if (key in prevTime) {
            elapsed=$2-prevTime[key]
            if (elapsed > 0 && $7 >= prevCpu[key]) {
                cpu=($7-prevCpu[key]) / (elapsed*10000)
                if (cpu > peak[key]) peak[key]=cpu
                totalCpu[key]+=$7-prevCpu[key]; totalTime[key]+=elapsed
                valid[key]++
            }
            if ($10 >= prevThrottle[key]) throttled[key]+=$10-prevThrottle[key]
            if ($11 >= prevThrottleTime[key]) throttleTime[key]+=$11-prevThrottleTime[key]
            if ($21 >= prevOom[key]) oom[key]+=$21-prevOom[key]
            if ($22 >= prevKill[key]) kills[key]+=$22-prevKill[key]
        }
        prevTime[key]=$2; prevCpu[key]=$7; prevThrottle[key]=$10; prevThrottleTime[key]=$11
        prevOom[key]=$21; prevKill[key]=$22
        lastOom[key]=$21; lastKill[key]=$22
    }
    END {
        print "CPU: 100% = one logical CPU; peaks are interval averages, not instantaneous maxima."
        print "Memory: observed = sampled during monitoring; cgroup peak may predate monitoring."
        print "Rows are separated by container ID and StartedAt. Short jobs between samples can be missed."
        for (k in name) {
            printf "\n--- %s (%s) ---\nStarted: %s | Docker restarts: %s | Samples: %d\n",name[k],id[k],started[k],restarts[k],count[k]
            if (valid[k]) printf "CPU sampled peak: %.1f%% | Average: %.1f%% | cpu.max: %s\n",peak[k],totalCpu[k]/(totalTime[k]*10000),cpuLimit[k]
            else printf "CPU: insufficient samples | cpu.max: %s\n",cpuLimit[k]
            printf "Memory observed peak: %.1f MiB | Cgroup lifetime peak: %.1f MiB | memory.max: %s bytes (max=unlimited)\n",mem[k]/1048576,life[k]/1048576,memLimit[k]
            printf "Swap observed peak: %.1f MiB | PIDs observed peak: %d\n",swap[k]/1048576,pids[k]
            printf "Observed counter increases: throttled periods=%d, throttled time=%.2fs, OOM=%d, OOM kills=%d\n",throttled[k],throttleTime[k]/1000000,oom[k],kills[k]
            printf "Last cgroup counters: OOM=%d, OOM kills=%d\n",lastOom[k],lastKill[k]
        }
    }' "$directory/containers.csv" > "$directory/summary.txt.tmp" || return 1
    if [[ -f "$directory/host.csv" ]]; then
        awk -F, 'NR==1 {next} {
            if (!n++ || $3<minimum) minimum=$3
            if ($4>swap) swap=$4
            if (n>1 && $5>previousTotal) {
                total=$5-previousTotal
                busy=100*(total-($6-previousIdle)-($7-previousWait))/total
                wait=100*($7-previousWait)/total
                if(busy>peak) peak=busy
                if(wait>peakWait) peakWait=wait
            }
            previousTotal=$5; previousIdle=$6; previousWait=$7
        } END {
            printf "\n--- Host ---\nSamples: %d | Minimum available RAM: %.1f MiB | Maximum used swap: %.1f MiB\n",n,minimum/1024,swap/1024
            printf "Sampled CPU busy peak: %.1f%% of host | I/O wait peak: %.1f%%\n",peak,peakWait
        }' "$directory/host.csv" >> "$directory/summary.txt.tmp"
    fi
    mv "$directory/summary.txt.tmp" "$directory/summary.txt"
    cat "$directory/summary.txt"
}

if [[ ${1:-} == --summarize ]]; then
    [[ $# == 2 ]] || { echo "Usage: $0 --summarize OUTPUT_DIR" >&2; exit 1; }
    summarize "$2"
    exit $?
fi

[[ $EUID == 0 ]] || { echo "Run as root to read host cgroups." >&2; exit 1; }
duration=${1:-43200}
interval=${2:-10}
[[ $duration =~ ^[1-9][0-9]*$ && $interval =~ ^[1-9][0-9]*$ ]] || {
    echo "Duration and interval must be positive whole seconds." >&2; exit 1;
}
proc_root=${MONITOR_PROC_ROOT:-/proc}
cgroup_root=${MONITOR_CGROUP_ROOT:-/sys/fs/cgroup}
output=${3:-"${MONITOR_OUTPUT_ROOT:-.}/resource-monitor-$(date -u +%Y%m%dT%H%M%SZ)"}
if [[ $# -gt 3 ]]; then shift 3; targets=("$@"); else targets=(); fi
[[ -r $cgroup_root/cgroup.controllers ]] || { echo "Requires host cgroup v2." >&2; exit 1; }
# Refuse to overwrite an earlier capture.
mkdir -m 700 "$output" || exit 1
umask 077
printf '%s\n' 'timestamp,uptime_seconds,name,id,started_at,restarts,cpu_usage_usec,cpu_user_usec,cpu_system_usec,nr_throttled,throttled_usec,cpu_max,memory_current,memory_peak,memory_max,swap_current,swap_peak,pids_current,pids_peak,memory_max_events,oom,oom_kill' > "$output/containers.csv"
printf '%s\n' 'timestamp,uptime_seconds,mem_available_kib,swap_used_kib,cpu_total_ticks,cpu_idle_ticks,cpu_iowait_ticks' > "$output/host.csv"
trap 'exit 130' INT
trap 'exit 143' TERM
trap 'summarize "$output"; echo "Capture saved to: $output"' EXIT
start=$SECONDS
printf 'Recording for %s seconds, every %s seconds, into %s\n' "$duration" "$interval" "$output"
while (( SECONDS-start < duration )); do
    timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    awk -v ts="$timestamp" -v proc_root="$proc_root" '
        FILENAME==proc_root "/uptime" {up=$1}
        $1=="MemAvailable:" {available=$2}
        $1=="SwapTotal:" {swapTotal=$2}
        $1=="SwapFree:" {swapFree=$2}
        FILENAME==proc_root "/stat" && $1=="cpu" {for(i=2;i<=9;i++) total+=$i; idle=$5; wait=$6}
        END {printf "%s,%s,%s,%s,%s,%s,%s\n",ts,up,available,swapTotal-swapFree,total,idle,wait}
    ' "$proc_root/uptime" "$proc_root/meminfo" "$proc_root/stat" >> "$output/host.csv"

    if ((${#targets[@]})); then
        selected=("${targets[@]}")
    else
        selected=()
        while IFS= read -r id; do [[ -z $id ]] || selected+=("$id"); done < <(docker ps -q --no-trunc)
    fi
    if ((${#selected[@]})); then
        while IFS='|' read -r name id pid started restarts; do
            [[ $pid =~ ^[1-9][0-9]*$ && -r $proc_root/$pid/cgroup ]] || continue
            relative=$(awk -F: '$1=="0" {print $3}' "$proc_root/$pid/cgroup")
            [[ -n $relative && $relative != / ]] || continue
            cg="$cgroup_root$relative"
            [[ -r $cg/cpu.stat && -r $cg/memory.current ]] || continue
            files=("$proc_root/uptime")
            for f in cpu.stat cpu.max memory.current memory.peak memory.max memory.swap.current memory.swap.peak pids.current pids.peak memory.events; do
                [[ ! -r $cg/$f ]] || files+=("$cg/$f")
            done
            # One read pass per container; handle removal during sampling without stopping the capture.
            awk -v ts="$timestamp" -v proc_root="$proc_root" -v name="${name#/}" -v id="$id" -v started="$started" -v restarts="$restarts" '
                BEGIN {v["memory.peak"]="NA"; v["memory.swap.peak"]="NA"; v["pids.peak"]="NA"}
                FILENAME==proc_root "/uptime" {up=$1; next}
                {n=FILENAME; sub(/^.*\//,"",n)}
                n=="cpu.stat" || n=="memory.events" {v[$1]=$2; next}
                {v[n]=$0}
                END {if (!("usage_usec" in v) || !("memory.current" in v)) exit 1
                    printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n",ts,up,name,id,started,restarts,v["usage_usec"],v["user_usec"],v["system_usec"],v["nr_throttled"]+0,v["throttled_usec"]+0,v["cpu.max"],v["memory.current"],v["memory.peak"],v["memory.max"],v["memory.swap.current"]+0,v["memory.swap.peak"],v["pids.current"],v["pids.peak"],v["max"]+0,v["oom"]+0,v["oom_kill"]+0
                }
            ' "${files[@]}" >> "$output/containers.csv" || echo "Container changed while sampling: $name" >&2
        done < <(docker inspect --type container --format '{{.Name}}|{{.Id}}|{{.State.Pid}}|{{.State.StartedAt}}|{{.RestartCount}}' "${selected[@]}")
    fi
    remaining=$((duration-(SECONDS-start)))
    ((remaining>0)) || break
    delay=$interval
    ((delay<=remaining)) || delay=$remaining
    sleep "$delay" &
    wait $! || true
done
