#!/bin/bash
mkdir ~/.pspacenotify
cp p-space-event.pl ~/.pspacenotify/
cp start.sh ~/.pspacenotify/
chmod +x  ~/.pspacenotify/start.sh  ~/.pspacenotify/p-space-event.pl
touch /tmp/pspace_event.pid
cp pspace.png ~/.pspacenotify/
echo "Exec=$HOME/.pspacenotify/start.sh" >> pspaceevent.desktop
echo "Icon=$HOME/.pspacenotify/pspace.png" >> pspaceevent.desktop
cp pspaceevent.desktop ~/.config/autostart
cp pspaceevent.desktop ~/.local/share/applications/
~/.pspacenotify/start.sh > /dev/null&
