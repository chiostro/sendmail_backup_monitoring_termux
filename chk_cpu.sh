#!/bin/bash
# Author Andrea Noto
# Lì mo  11 Sep 2026
# Funzione per ottenere l'uso della CPU
get_cpu_usage() {
    # Mostra l'uso della CPU con top
    top -n 1 | grep "CPU" | awk '{print "CPU Usage: " $2 $3 $4 $5}'
}

# Funzione per ottenere informazioni sulla CPU
get_cpu_info() {
    # Mostra informazioni generali sulla CPU
    echo "CPU Info:"
    cat /proc/cpuinfo | grep "model name" | uniq
}

# Funzione per ottenere la temperatura della CPU (se disponibile)
get_cpu_temp() {
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        # Su molti dispositivi Android, la temperatura è in /sys/class/thermal/thermal_zone0/temp
        temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        echo "CPU Temperature: $((temp / 1000))°C"
    else
        echo "No temperature info available."
    fi
}

# Funzione per ottenere l'uptime del sistema
get_uptime() {
    # Mostra il tempo di attività del sistema
    echo "Uptime: $(uptime -p)"
}

# Mostra tutte le informazioni
echo "==== CPU Status ===="
get_cpu_usage
get_cpu_info
get_cpu_temp
get_uptime
echo "====================="

