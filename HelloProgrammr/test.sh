#!/usr/bin/env bash
curdir=$(pwd)
echo $curdir
cd ..
parentdir=$(pwd)
echo $parentdir


projectname=$(echo $curdir | awk -F/ '{print $(NF)}') 
echo $projectname
tmpdir=$(echo $parentdir | awk -F/ '{print $(NF)}') 
echo $tmpdir
echo "Current date: $tmpdir"