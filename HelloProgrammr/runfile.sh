#!/usr/bin/env bash
projectname=$(echo $1 | awk -F/ '{print $(NF)}') 
echo $projectname
echo "Deploying "$projectname

curl -s https://tok_fpym7vqveexadk8t3m9ru9cg7m@api.appetize.io/v1/apps -F "file=@$1/$projectname.app.zip" -F "platform=ios" > .outputurl
echo "done"