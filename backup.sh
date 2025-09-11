#!/bin/bash
test -z$1 && echo "As parameter $0 folder path. Default is  Download"
SOURCE_DIR=${1:-/storage/emulated/0/Download}
WKPATH=`pwd`
cd $SOURCE_DIR
tar -czf $WKPATH/$(date +"%y%m%d_%H%M")_backup.tar.gz .
cd -


