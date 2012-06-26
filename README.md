Hackerspace Event and Status Notifier
=============

The Hackerspace Event Notifier is a small script in perl I created to notify me when an event from [P-Space](http://p-space.gr/), the local hacker-space, happens.
In addition, it checks for the status of P-space.
How it works
-------
The (Hackerspace) Status Notifier checks for the contents of a specified **URL**, by default http://pspace.dyndns.org/report/ and notifies the user upon change. It uses 'notify-send' command for notifications from [Galano libnotify](http://www.galago-project.org/specs/notification/).
How to use it
-------
You may need to install libwww-perl package first!

Download all the files and extract them. Open terminal, change directory to extracted dir and run ./setup.sh
Greek
-------
Για Ελληνικά δείτε [εδώ](http://wiki.p-space.gr/doku.php?id=projects:notifier)