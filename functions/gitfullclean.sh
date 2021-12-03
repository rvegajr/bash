#!/bin/bash

protected_branch='master'
ref=$(git symbolic-ref HEAD 2> /dev/null) || \
ref=$(git rev-parse --short HEAD 2> /dev/null) || return
current_branch=${ref#refs/heads/}

# echo "Current branch is {$current_branch}"
read -p "This will completely reset this branch, are you sure? [y|n] " -n 1 -r < /dev/tty
echo
if echo $REPLY | grep -E '^[Yy]$' > /dev/null
then
	echo "git checkout -f ${current_branch}"
	git checkout -f ${ref#refs/heads/}
	exit 0 
fi
exit 1 
