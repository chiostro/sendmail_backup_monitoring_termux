#!/bin/bash
# Author Andrea Noto
# Lì mo  11 Sep 2026
# % Storage used
test -f ~/.msmtprc && receiver=` awk '$1=="from" { print $2}' ~/.msmtprc `
# Soglie di utilizzo (modifica in base alle tue preferenze)
STORAGE_THRESHOLD=80    # Soglia di utilizzo dello storage (%)

# Funzione per inviare email (configurato con msmtp o mailx)
send_email_notification() {
    SUBJECT="Monitoraggio Risorse - Avviso"
    BODY="Ciao, il sistema ha superato la soglia di monitoraggio delle risorse:\n\n$1"
    test -z $receiver ||  echo  "Subject: $SUBJECT\n\n$BODY" | msmtp $receiver
}


# Confronta se l'uso dello storage supera la soglia
check_storage_usage() {
    # Usa df per ottenere l'uso dello spazio su disco
    STORAGE_USAGE=$(df /data | grep /data | awk '{print $5}' | sed 's/%//')
    echo "Uso dello Storage: $STORAGE_USAGE%"

    # Confronta se l'uso dello storage supera la soglia
    if [ $STORAGE_USAGE -gt $STORAGE_THRESHOLD ]; then
        echo "Soglia Storage superata! ($STORAGE_USAGE%)"
        send_email_notification "Uso dello Storage ha superato $STORAGE_THRESHOLD% (attuale: $STORAGE_USAGE%)"
    fi
}

# Controlla l'uso dello Storage
check_storage_usage

