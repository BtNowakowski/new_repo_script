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

if !(test -d $directory); then
  echo "Provided directory doesnt exist."
  exit 2;
fi

mkdir $path
cd $path
mkdir source
touch README.md
touch .gitignore
touch requirements.txt
echo $'.pytest_cache\n.vscode\n/source/__pycache__' >> .gitignore
echo "#$repo_name" >> README.md
git -C "$path" init 
git -C "$path" config --global user.email "<YOUR EMAIL>"
git -C "$path" config --global user.name "<YOUR NAME>"
git -C "$path" add .
git -C "$path" commit -m "Initial commit"
code .
