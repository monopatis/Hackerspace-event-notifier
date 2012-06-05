#!/bin/bash
mkdir ~/.pspacenotify
cp p-space-event.pl ~/.pspacenotify/
cp pspace.png ~/.pspacenotify/
echo "Exec=$HOME/.pspacenotify/p-space-event.pl" >> pspaceevent.desktop 
echo "Icon=$HOME/.pspacenotify/pspace.png" >> pspaceevent.desktop 
cp pspaceevent.desktop ~/.config/autostart
cp pspaceevent.desktop ~/.local/share/applications/
~/.pspacenotify/p-space-event.pl > /dev/null&


