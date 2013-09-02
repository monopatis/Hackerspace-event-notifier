#!/usr/bin/perl

use strict;
#use warnings;
use LWP::Simple;
use FindBin;
#$0 = "stealth";
my $event = 'foo';
my $string = 'Remote';
my $oldevent = 'foo';
my $message = 'foo';
my $user = 'foo';
my $time = '00:00';
my $url = 'http://pspace.dyndns.org/report/index.php?limit=1&nostyle';
my $statusurl = 'http://www.p-space.gr/status/';
my $status = 1;
my $oldstatus = 0;
my $statusmsg = 'foo';
$oldstatus = get("$statusurl");
#add # if you want to see the last event on start
#$oldevent = get("$url");
my @values = split(' ', $oldevent);
#always
while (1==1)
{
	$event = get("$url");
	$status = get("$statusurl");
	if ($oldevent ne $event){
		$oldstatus = $status ;
		if ($status == 1) {
#                       print "\n       P-space is open         \n";
                	$statusmsg = "P-Space is open";
                }
                else {
#                       print "\n               P-space closed          \n";
                	$statusmsg = "P-Space is closed";
                }

		if ($event ne ""){
			 $oldevent = $event ;
		} 
		@values = split(' ', $oldevent);
		my $diftime= time()-$values[0]+28800;
		my ($sec, $min, $hour, $day,$month,$year) = (gmtime($diftime))[0,1,2,3,4,5];
		$hour=$hour+($day-1)*24;
#		print "Unix time ".$diftime." means ".$day." day, ";
#		print " ".$hour.":".$min.":".$sec."\n";
		my $secs = sprintf("%02d", $sec);
		my $mins = sprintf("%02d", $min);
		my $hours = sprintf("%02d", $hour);
		if ($hour>0){
			
			$time = "$hour:$mins:$secs hours ago";
		}
		else{ 
			if ($min>0) {
				$time = "$min:$secs mins ago";
			}
			else {
				$time = "$sec secs ago";
				if ($sec<15) {
					$time = "just now";
				} 
			}
		}
		if ($string eq $values[1]){
			$message = "remote button pressed";
		}
		else { 
			@values = split('<', $values[1]);
			$user = $values[0];
			$message = 'Card used by ' . $user ; 
		}
#		system("notify-send 'P-space is open' '$message, $time ago' -t 60  -i $FindBin::Bin/logo.png");
# 		Use this for fedora and gnome3
		if ($user ne "" && $event ne "") {
			system("notify-send '$statusmsg' '$message, $time' --hint=int:transient:1  -i ~/.pspacenotify/pspace.png");
		}
	}
	sleep(15);
}
