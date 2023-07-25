#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: `basename "$0"` <original> <modified>"
	echo "<original>: path to original (unmodified) directory/file."
    echo "<modified>: path to directory/file with modifications."
	exit
else
    # path to original (unmodified) directory/file
    original=$1
    # path to directory/file with modifications
    modified=$2
fi	

# check if the original is available as zipped archive or directly
if [ ! -d ${original} ]; then
    tgz=${original%%/*}
    if [ ! -f ${tgz}.* ]; then
        echo "Could not find ${original}/ nor ${tgz}.*. Abort."
        exit
    fi   
    # if there is tar archive, extract
    tar -xvf ${tgz}.*
fi

# name of the patch
diff_object=${modified##*/}

# create diff
diff --unidirectional-new-file -r -U 1 ${original} ${modified} > ${diff_object}.patch