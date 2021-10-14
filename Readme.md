# Build Firmware Project
Dieses Skript ermöglicht es relativ einfach, eine bootfähige Firmware für den Rapberry Pi aufzusetzen.
Das System und die Benötigten Dependencies werden mithilfe eines Weiteren Skriptes auf dem Raspberry installiert.
Das Skript setzt zudem ein Weiteres System auf, welches für Firmware Updates, Upgrades und Reparaturen benutzt werden kann.
Hinweis es wird ein Linux Betriebssystem vorausgesetzt.

# System Grundeinstellungen
Der Aufbau der SD Karte sieht folgendermaßen aus:
- BOOT (FAT32)
  - Hier liegt der Raspberry Bootloader
- ROOT (EXT4)
  - Hier liegt das Normale Betriebssystem für den Raspberry
- RESCUE (EXT4)
  - Hier liegt das Rescue Betriebssystem für den Raspberry
- IMAGE (EXT4)
  - Hier können Firmare Images Abgelegt werden
- CONFIG (FAT32)
  - Hier können Einstellungen und Logs des Systems Abgelegt werden

Die Größe der Images können hier auch Verändert werden.

Der Image Name des Betriebssystems und die Download URL können hier definiert werden.
Die Namen der Images Können auch geändert werden, das Installations Skript sollte allerdings dann Angepasst werden.
Da das Skript als Root Ausgeführt wird, sollte man das Image Per Hand Herunterladen, oder den Download nur aus Sicheren Quellen benutzen.



# Allgemeine Informationen
- Die Allgemeine Informationen wie z.B. Keyboard Layout, Systemsprache, Internet Check Addresse und Development Akkount werden hier aufgesetzt:
		Data/root+rescue/usr/automat-oem-install/Skripte/Normal
- Hinweis: Den Development Akkount nur für die Development Umgebung verwenden, da Hier der Komplette Benutzer mit Password, sowohl der Root Akkount mit Password automatisch gesetzt werden!
- Optional kann hier auch eine WLAN-SSID und Passwort hinterlegt werden, allerdings ist diese Funktion noch nicht Implementiert.
- Da das Skript auch die Raspberry Zeit testet, kann diese hier als UNIX Zeit Hinterlegt werden.



# Normal System
- Die Konfiguration liegt unter
		Data/root+rescue/usr/automat-oem-install/Skripte/Normal
- Hinweis: für ein Development System liegt die Datei unter
		Data/root+rescue/usr/automat-oem-install/Skripte/Normal-dev
- Diese Skripte werden als Root am Ende des Aufgesetzten Systems installiert und Konfigurieren es auch

# Rescue System
- Die Konfiguration liegt unter
		Data/root+rescue/usr/automat-oem-install/Skripte/Rescue
- Hinweis: für ein Development System liegt die Datei unter
		Data/root+rescue/usr/automat-oem-install/Skripte/Rescue-dev
- Diese Skripte werden als Root am Ende des Aufgesetzten Systems installiert und Konfigurieren es auch


# Anleitung:
- Als erstes das Buildskript Starten:
		sudo ./Buildskript
- Im nächsten Schritt müssen sie das Laufwerk auswählen, aufdem das System Installiert werden soll.






# Unterstüzte Raspberry Betriebssysteme:
- Manjaro ARM Raspberry Pi 4 Minimal

# Getestete Raspberrys:
- Raspberry Pi 3B+
- Raspberry Pi 4B



# ToDo's
- Wlan Einrichtung
- Fertiges Image als .img abspeichern anstatt Firmware Schreiben.
