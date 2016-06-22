#!/bin/bash 

module purge
module load ruby

dirpath=`dirname $0`


for f in $@
do
	if [ -f  $f ]; then 
		manfile=`basename $f | cut -d "." -f 1`
		ronn $f
		mv $dirpath/ronn/$manfile.html $dirpath/html/
		mv $dirpath/ronn/$manfile      $dirpath/man/
	fi
done
