# lib-config
## Knihovna pro práci s konfiguračními soubory v Linux bash

Skript/knihovna "lib_config.sh" poskytuje základní funkce pro práci s konfiguračními soubory.
Je možno ji prostřednictvím příkazu "source lib_config.sh" importovat do skriptu a využívat
její funkce pro čtení a zápis parametrů, nebo čtení celých sekcí.

Detailněji použití demonstruje skript "example.sh".

### Implementované funkce
- **GetParameter ( $jmeno )** - přečtení hodnoty klíče ( v sekci **main** )
- **SetParameter ( $jmeno $hodnota )** - nastavení hodnoty již existujícího klíče ( v sekci **main** ) 
- **GetSection ( $jmeno )** - přečtení sekce do proměnné

Před použitím funkcí je třena nastavit jméno a cestu ke konfiguračnímu souboru do proměnné **$cnffile**

### Formát konfiguračního souboru

```
#
# konfiguracni soubor pro skript example.sh
#
[main]
# jednotlive hlavni parametry
name=Example
backupdir=/opt/backup
examplelog=log-example.txt
opt=1

[databases]
#
# seznam databazi
#
databaze_prvni
databaze_druha

[users]
#
# seznam uživatelů
#
emil
jana
jirka

```

### Známé nedostatky

