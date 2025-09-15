DIR=$( basename `pwd`)
echo "#!/data/data/com.termux/files/usr/bin/bash

# Cambia directory al percorso desiderato
cd  ~/$DIR >/dev/null

# Verifica che il cd sia riuscito
if [ $? -ne 0 ]; then
    echo \"Impossibile accedere alla directory specificata.\"
    exit 1
fi

./alertmem.sh
./chk_cpu.sh
./chk_storage.sh
./autobck.sh" > run.sh
chmod +x run.sh
mkdir -p ~/.shortcuts/$DIR
mv run.sh ~/.shortcuts/$DIR
