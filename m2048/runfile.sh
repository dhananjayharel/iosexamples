#!/usr/bin/env bash
curdir=$(pwd)

cd ..
parentdir=$(pwd)

projectname=$(echo $curdir | awk -F/ '{print $(NF)}') 

tmpdir=$(echo $parentdir | awk -F/ '{print $(NF)}') 

echo "Deploying please wait.."
FILE=$curdir/$projectname.app.zip
if [ -f "$FILE" ]; then
    echo "ok"
    cd $curdir
    curl -s https://tok_fpym7vqveexadk8t3m9ru9cg7m@api.appetize.io/v1/apps -F "file=@$1/$projectname.app.zip" -F "platform=ios" > .outputurl
    
else 
    echo "ok"
    ssh  user165715@103.228.153.44 "cd ~/Downloads/$tmpdir/$projectname/Build/Products/Debug-iphonesimulator; zip -r $projectname.app.zip $projectname.app"
    cd $curdir
    scp -r user165715@103.228.153.44:~/Downloads/$tmpdir/$projectname/Build/Products/Debug-iphonesimulator/$projectname.app.zip ./
    curl -s https://tok_fpym7vqveexadk8t3m9ru9cg7m@api.appetize.io/v1/apps -F "file=@$1/$projectname.app.zip" -F "platform=ios" > .outputurl
fi


echo "done"