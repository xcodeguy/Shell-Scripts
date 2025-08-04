#!/bin/sh
clear
echo "Welcome to GuidLister! Copyright(c) 2012 AppGiraffe LLC"
echo
stream=$(find ~/Downloads -name '*.mobileprovision')
if [[ $stream ]] ; then
	for f in $(find ~/Downloads -name '*.mobileprovision'); do
		echo "Finding $f";
		uuid=$(grep UUID -A1 -a "$f" | grep -o "[-A-Z0-9]\{36\}");
		echo "-------------------------------------------------------------------------------------------------------------------------------------------------"; 
		echo "Number to paste: $uuid    From file: $f";
	done
else
	echo "There are no mobile provisioning files in the ~/Downloads folder. Nothing to do."
fi
echo
