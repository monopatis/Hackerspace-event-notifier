#!/usr/bin/env bash
if [ -f "/tmp/pspace_report.pid" ]; then
   pid=`cat /tmp/pspace_event.pid`
else
   pid=0
fi
if [ -e /proc/$pid -a /proc/$pid/exe ]; then
	kill $pid
fi
./p-space-event.pl&
echo $! > /tmp/pspace_event.pid
