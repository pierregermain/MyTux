#!/bin/bash
echo " Checking if Directories exist ..."
if [ ! -d "$MyData" ]; then
    echo "$MyData does NOT exist"
fi

if [ ! -d "$MyMuz" ]; then
    echo "$MyMuz does NOT exist"
fi
echo "Do you want to continue?(y/n)"

read input
if [ "$input" == "y" ]
then
	ln --symbolic --interactive --verbose --no-dereference $MyData/BC ~/BC
	ln --symbolic --interactive --verbose --no-dereference $MyData/BS ~/BS
	ln --symbolic --interactive --verbose --no-dereference $MyData/CURRO ~/CURRO
	ln --symbolic --interactive --verbose --no-dereference $MyData/ ~/DATA
        echo "Desktop has to be done manually"
	ln --symbolic --interactive --verbose --no-dereference $MyData/Downloads ~/Downloads
	ln --symbolic --interactive --verbose --no-dereference $MyData/Pictures ~/Pictures
	ln --symbolic --interactive --verbose --no-dereference $MyData/PIERRE ~/PIERRE
	ln --symbolic --interactive --verbose --no-dereference $MyData/REFERENCE ~/REFERENCE
	ln --symbolic --interactive --verbose --no-dereference $MyData/GIT_APPS ~/GIT_APPS
	ln --symbolic --interactive --verbose --no-dereference $MyData/GIT_REPOS ~/GIT_REPOS
	ln --symbolic --interactive --verbose --no-dereference $MyData/GIT_WIKIS ~/GIT_WIKIS
	ln --symbolic --interactive --verbose --no-dereference $MyData/.mutt ~/.mutt
	ln --symbolic --interactive --verbose --no-dereference $MyData/.thunderbird ~/.thunderbird
	ln --symbolic --interactive --verbose --no-dereference $MyData/.ssh ~/.ssh
	ln --symbolic --interactive --verbose --no-dereference $MyMuz ~/MUZ
fi
