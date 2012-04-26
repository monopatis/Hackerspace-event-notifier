#!/bin/bash
cp p-space-event.pl ~/ 
cp pspace.png ~/
echo "Exec=$HOME/p-space-event.pl" >> pspaceevent.desktop 
echo "Icon=$HOME/pspace.png" >> pspaceevent.desktop 
cp pspaceevent.desktop ~/.config/autostart
cp pspaceevent.desktop ~/.local/share/applications/
~/p-space-event.pl&


