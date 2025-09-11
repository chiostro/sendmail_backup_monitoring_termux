#!/bin/bash
# Author Andrea Noto
# Lì mo  11 Sep 2026
#Nota importante: Se hai l'autenticazione 
#a 2 fattori abilitata su Gmail, 
#dovrai creare una password per le app 
#per poterla usare nel campo password. 
#Puoi generare una password per 
#le app nelle impostazioni del tuo 
#account Google.

test -z $1 && echo "Write your email please.\nyouraccount@gmail.com"&& exit 1
test -z $2 && echo "Write your password please.\nxxxx xxxx xxxx xxxx "&& exit 1
passe=`echo "$*"|awk '{$1=""; sub(/^ /,""); print}'`

pkg install -y msmtp
pkg install -y mutt

echo "set sendmail=\"/usr/bin/msmtp\"">~/.muttrc
echo "account default
host smtp.gmail.com
port 587
from $1
user $1
password $passe
auth login
tls on"> ~/.msmtprc
chmod 600 ~/.msmtprc


