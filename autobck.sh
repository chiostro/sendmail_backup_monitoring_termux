# Prerequsite  obfuscate-file-gpf cloned
# Prerequsite  Passwod Managr cloned 
receiver=` awk '$1=="from" { print $2}' ~/.msmtprc `
./backup.sh
Pass=`ls -rt ../password-manager-bash/password_store.*.gpg 2>/dev/null|tail -1`
if [ -f "$Pass" ];then
   pass=`gpg --quiet --pinentry-mode loopback --decrypt $Pass `
else
   echo "Create  password file using PasswordManager"&&exit 1
fi
ls -rt *.gz |tail -1 > list.txt
bckupname=`cat list.txt`
tar -tzf $bckupname >> list.txt
sh ../obfuscate-file-gpg/obfuscate.sh $bckupname  $pass
cat list.txt | mutt -s "$bckname password is crypted in $Pass" -a list.txt -- $receiver
mv $bckupname.gpg  ~/.
