#!/usr/bin/env bash
# Version: 1.0.0

set -u
export LC_ALL=C
shopt -s nullglob

OUT="${1:-power-info-$(hostname)-$(date +%F).txt}"

dmi()
{
    local f="/sys/class/dmi/id/$1"

    if [[ -r "$f" ]]; then
        cat "$f"
    else
        echo "n/a"
    fi
}

{
    echo "============================================================"
    echo " Power test - hardware information"
    echo "============================================================"
    echo
    echo "Date       : $(date --iso-8601=seconds)"
    echo "Hostname   : $(hostname)"
    echo

    echo "---- Operating system ---------------------------------------"
    if [[ -r /etc/os-release ]]; then
        . /etc/os-release
        echo "OS         : ${PRETTY_NAME:-unknown}"
    fi
    echo "Kernel     : $(uname -r)"
    echo "Cmdline    : $(cat /proc/cmdline)"
    echo

    echo "---- System -------------------------------------------------"
    echo "Vendor     : $(dmi sys_vendor)"
    echo "Product    : $(dmi product_name)"
    echo "Version    : $(dmi product_version)"
    echo

    echo "---- Mainboard ----------------------------------------------"
    echo "Vendor     : $(dmi board_vendor)"
    echo "Board      : $(dmi board_name)"
    echo "Version    : $(dmi board_version)"
    echo

    echo "---- BIOS ---------------------------------------------------"
    echo "Vendor     : $(dmi bios_vendor)"
    echo "Version    : $(dmi bios_version)"
    echo "Date       : $(dmi bios_date)"
    echo

    echo "---- CPU ----------------------------------------------------"
    lscpu | grep -E \
      '^(Architecture|CPU\(s\)|Vendor ID|Model name|CPU family|Model:|Stepping|Thread\(s\) per core|Core\(s\) per socket|Socket\(s\)|CPU max MHz|CPU min MHz):'
    echo

    echo "---- CPU power management -----------------------------------"

    CPUFREQ="/sys/devices/system/cpu/cpu0/cpufreq"

    if [[ -r "$CPUFREQ/scaling_driver" ]]; then
        echo "Scaling driver   : $(cat "$CPUFREQ/scaling_driver")"
    fi

    if [[ -r "$CPUFREQ/scaling_governor" ]]; then
        echo "Governor         : $(cat "$CPUFREQ/scaling_governor")"
    fi

    if [[ -r "$CPUFREQ/energy_performance_preference" ]]; then
        echo "Energy preference: $(cat "$CPUFREQ/energy_performance_preference")"
    fi

    if [[ -r /sys/devices/system/cpu/intel_pstate/status ]]; then
        echo "Intel P-state    : $(cat /sys/devices/system/cpu/intel_pstate/status)"
    fi

    if [[ -r /sys/devices/system/cpu/cpuidle/current_driver ]]; then
        echo "Idle driver      : $(cat /sys/devices/system/cpu/cpuidle/current_driver)"
    fi

    echo
    echo "CPU0 idle states:"

    for state in /sys/devices/system/cpu/cpu0/cpuidle/state*; do
        name=$(cat "$state/name" 2>/dev/null || echo "?")
        latency=$(cat "$state/latency" 2>/dev/null || echo "?")
        disabled=$(cat "$state/disable" 2>/dev/null || echo "?")

        printf "  %-10s latency=%-6s us disabled=%s\n" \
            "$name" "$latency" "$disabled"
    done

    echo
    echo "---- Memory -------------------------------------------------"
    awk '/MemTotal:/ {
        printf "Installed   : %.2f GiB\n", $2 / 1024 / 1024
    }' /proc/meminfo
    echo

    echo "---- Block devices ------------------------------------------"
    lsblk -d -e 7 -o NAME,MODEL,SIZE,ROTA,TRAN,TYPE
    echo

    echo "---- PCI devices --------------------------------------------"
    if command -v lspci >/dev/null; then
        lspci -nn
    else
        echo "lspci not installed"
    fi

    echo
    echo "---- Manual test information -------------------------------"
    echo "Wall meter       :"
    echo "PSU / power brick:"
    echo "Display attached :"
    echo "Network          :"
    echo "Other notes      :"

} | tee "$OUT"

echo
echo "Saved: $OUT"
