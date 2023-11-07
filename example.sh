#!/bin/bash
#
# PRIKLAD POUZITI lib_config.sh (c) Ing. Lubomir Briza
#
scriptdir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $scriptdir/lib_config.sh
# nastavení jména konfiguračního souboru
cnffile="$scriptdir/example.conf"
name=$(GetParameter name)
echo "============================="
echo ""
echo "   jméno skriptu: $name"
echo ""
echo "============================"
echo ""
echo "konfigurační soubor:  $cnffile"
echo "adresar:  $scriptdir"
backupdir=$(GetParameter backupdir)
examplelog=$(GetParameter examplelog)
opt=$(GetParameter opt)
echo ""
echo "Parametry načtené ze souboru:"
echo "    adresář pro zálohy:  $backupdir"
echo "    logovací soubor:  $examplelog"
echo "    jiný parametr:  $opt"
echo ""
echo "Nastavuji novou hodnotu parametru"
SetParameter opt 1234
opt=$(GetParameter opt)
echo ""
echo "... nova hodnota = $opt"
echo ""
echo "Nastavuji původní hodnotu parametru"
SetParameter opt 1
echo ""
echo ""
echo "=========================================="
echo "   SEZNAM DATABÁZÍ (načtení celé sekce)"
echo "=========================================="
for dbname in $(GetSection databases); do
  echo $dbname
done
echo "=========================================="
