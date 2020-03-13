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
cd $curdir
rm $projectname.zip
rm $projectname.app.zip

zip $projectname -r ./
#ssh user165715@103.228.153.44 "cd ~/Downloads; rm -rf $tmpdir"
ssh user165715@103.228.153.44 "cd ~/Downloads; rm -rf $tmpdir; mkdir $tmpdir; cd $tmpdir; mkdir $projectname"
scp $projectname.zip user165715@103.228.153.44:~/Downloads/$tmpdir/$projectname

#scp -r $curdir user165715@103.228.153.44:~/Downloads/$tmpdir
ssh user165715@103.228.153.44 "cd ~/Downloads/$tmpdir/$projectname/; unzip $projectname.zip; xcrun xcodebuild -scheme $projectname -project $projectname.xcodeproj -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 11,OS=13.3' build"
#projectpath=$(ssh  user165715@103.228.153.44 "find ~/Library/Developer/Xcode/DerivedData -maxdepth 1  -name  '$projectname-*'")
#echo $projectpath

