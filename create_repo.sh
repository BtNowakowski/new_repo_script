#!/bin/sh
if [ $# != 1 ]; then
	echo "        "
	echo " NO PARAMETERS PROVIDED"
	echo " ---------------------------------"
	echo " Script takes a name of repository to be created as a parameter!"
	echo " Usage: ./create_repo.sh new_repo_name"
	echo " ---------------------------------"
	exit 2;
fi

repo_name=$1
directory="<PATH FOR REPOSITORIES>"
path=$directory/$repo_name
mkdir $path
git -C "$path" init 
git -C "$path" config --global user.email "<YOUR EMAIL>"
git -C "$path" config --global user.name "<YOUR NAME>"
cd $path
code .
