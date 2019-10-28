#!/bin/bash
set -e

USERNAME="$1"
DBNAME="$2"
PASSWORD="$3"
IRODSPATH="$4"
DELETEALL="-x"

for path in `ls -d ../../planet-microbe-datapackages/*`
do
    file=$path/datapackage.json
    if test -f $file; then
        ./load_datapackage_postgres2.py $DELETEALL -u $USERNAME -d $DBNAME -p $PASSWORD -i $IRODSPATH $file
    fi
    DELETEALL=""
done
