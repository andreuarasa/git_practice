#!/bin/bash

echo "Welcome!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "Your version number is $version"
echo "Do you wish to proceed with the current version?
Enter "1" for yes
Enter "0" for no"
read versioncontinue
if [ $versioncontinue -eq 1 ]
  then
    echo "OK"
    for filename in source/*
    do
      if [ $filename != source/secretinfo.md ]
      then
        echo "Copying $filename"
        mv $filename build/
      else
        echo "Not copying $filename"
      fi
    done
    cd build/
    echo "Build version $version contains:"
    ls
    cd ..
  else
    echo "Please come back when you are ready"
fi
