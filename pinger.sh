#!/bin/bash

#Pass the file name containg ip as a commandline argument
fname=$1 

echo "Pinger v1.1 c0ded by dibyendu"
while read -r ip
do
	echo "Checking if $ip is up...."

	#We are pinging a website/webserver by its ip/domain
	#Now we are sending 2 packets. The ouput generally comes like this
	#PING site.com (111.111.111.111) 56(84) bytes of data.
	#64 bytes from something.net (111.111.111.111): icmp_seq=1 ttl=128 time=80.5 ms
	#64 bytes from something.net (111.111.111.111): icmp_seq=2 ttl=128 time=80.3 ms
	
	#We will capture the line containg the word "bytes" and count it.
	#0 means host is down or less than 2 means some packet loss has occured

	#Note: You can add as many packets as u want

	ctr=`ping -c 2 $ip | grep bytes | wc -l`
	if [ $ctr -eq 3 ]
	then
		echo "Host is up"
	elif [ $ctr -eq 0 ]
	then
		echo "Host is down"
	else
		echo "Host is up but there are some loss in packets"
	fi
	echo "-------------------------------------------------------------"

	done < "$fname"
