#!/bin/bash 


if [ "$(type -t module)" = function ]; 
then
    module purge
    module load ruby
elif [ ! "$(type -t ronn)" = file ];
then
    echo "ronn not available"
    exit 1
fi

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
