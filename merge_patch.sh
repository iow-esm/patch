#!/bin/bash

if [ $# != 3 ]; then
	echo "Usage: `basename "$0"` <original> <patch> <modified>"
	echo "<original>: path to original (unmodified) directory/file."
    echo "<patch>" : path to the patch file
    echo "<modified>: path to directory/file with modifications (will be created)."
	exit
else
    original=$1
    patch_file=$2
    modified=$3
fi	

# check if path to patch file is relative
if [ ! ${patch_file:0:1} == "/" ]; then
    # get absolute path to patch file
    patch_file=$(realpath ${patch_file})
fi

# find correct path in original and apply patch
path=${original%"/${modified}"*}
cd ${path}
patch -s -p0 -E -f -i ${patch_file}
cd -

# remove empty files/directories
for f in `cat ${patch_file} | grep "Only in ${original}" | sed 's/^.*://'`; do
    rm -r ${original}/$f
done
mv ${original} ./${modified}

# remove original
original_root=${original%%/*}
if [ -d ${original_root} ] || [ -f ${original_root} ]; then
    rm -r ${original_root}
fi