#!/bin/sh
#
#  manipulace s konfiguračními soubory
#
#---------------------------------------
#
function GetParameter {
#  $1 ... jmeno parametru
#
  local tmp=$(grep "$1=" $cnffile)
  echo `expr match "$tmp" '.*=\(.*\)'`
}

#sed -i 's\opt=1\opt=3\g' ./example.conf
#
function SetParameter {
#  $1 ... jmeno parametru
#  $2 ... hodnota parametru
#
  local tmp=$(GetParameter $1)
  sed -i "s\\$1=$tmp\\$1=$2\\g" $cnffile
}

function GetSection {
#  $1 ... jmeno sekce
#
  local vystsec=0
  while read line; do
    # reading each line
    if [ $vystsec -eq 1 ]; then
      if [ "${line:0:1}" = "#" ] || [ "${line:0:1}" = ";" ] || [ "$line" = "" ]; then
        # ignorovat komentare a prazdne radky
        kom=1
      else
        if [ "${line:0:1}" = "[" ]; then
          # zacatek dalsi sekce ukoncit vystup
          vystsec=0
        else
          # platna radka
          echo $line
        fi
      fi
    fi
    if [ "$line" = "[$1]" ]; then
      vystsec=1
    fi
  done < $cnffile
}
