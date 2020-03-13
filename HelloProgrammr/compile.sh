#!/usr/bin/env bash
curdir=$(pwd)
echo $curdir

projectname=$(echo $curdir | awk -F/ '{print $(NF)}') 
echo $projectname
tmpdir=$(($(date +%s%N)/10000000))
echo $tmpdir
echo "Current date: $tmpdir"
zip $projectname -r ./
ssh user165715@103.228.153.44 "cd ~/Downloads; mkdir $tmpdir; cd $tmpdir; mkdir $projectname"
scp $projectname.zip user165715@103.228.153.44:~/Downloads/$tmpdir/$projectname

#scp -r $curdir user165715@103.228.153.44:~/Downloads/$tmpdir
var1=$(ssh user165715@103.228.153.44 "cd ~/Downloads/$tmpdir/$projectname/; unzip $projectname.zip; xcrun xcodebuild -scheme $projectname -project $projectname.xcodeproj -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 11,OS=13.3' build")
#projectpath=$(ssh  user165715@103.228.153.44 "find ~/Library/Developer/Xcode/DerivedData -maxdepth 1  -name  '$projectname-*'")
#echo $projectpath
if echo "$var1" | grep -q "BUILD SUCCEEDED"
then
ssh  user165715@103.228.153.44 "cd ~/Downloads/$tmpdir/$projectname/DerivedData/$projectname/Build/Products/Debug-iphonesimulator; zip -r $projectname.app.zip $projectname.app"
cd $curdir
scp -r user165715@103.228.153.44:~/Downloads/$tmpdir/$projectname/DerivedData/$projectname/Build/Products/Debug-iphonesimulator/$projectname.app.zip ./
echo "SUCCESS"
else   
echo "SYNTAXERROR"
fi
echo ""
echo "!done!"

