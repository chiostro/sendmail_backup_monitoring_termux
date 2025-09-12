receiver=` awk '$1=="from" { print $2}' ~/.msmtprc `
tar -czf  AllSIGNED-non-belligerence_pact.pdf.gz AllSIGNED-non-belligerence_pact.pdf 
sh ../obfuscate-file-gpg/obfuscate.sh AllSIGNED-non-belligerence_pact.pdf.gz  Tanto
echo "Questo è il corpo del messaggio" | mutt -s "Oggetto dell'email" -a AllSIGNED-non-belligerence_pact.pdf.gz.gpg -- $receiver

