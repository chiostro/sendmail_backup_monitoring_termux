receiver=` awk '$1=="from" { print $2}' ~/.msmtprc `
echo "Questo è il corpo del messaggio" | mutt -s "Oggetto dell'email" -a AllSIGNED-non-belligerence_pact.pdf -- $receiver 

