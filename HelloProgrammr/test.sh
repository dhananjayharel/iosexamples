#!/bin/bash
curdir=$1
echo $curdir
cd ..
parentdir=$(pwd)
echo $parentdir
prjname=$(echo $1 | awk -F/ '{print $(NF)}') 
echo $prjname
tmpdir=$(($(date +%s%N)/10000000))
echo $tmpdir
echo "Current date: $tmpdir"
ssh  user165715@103.228.153.44 "cd ~/Downloads; mkdir $tmpdir"
scp -r $curdir user165715@103.228.153.44:~/Downloads/$tmpdir/



echo "done"