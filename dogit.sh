#!/bin/bash

if (( $# == 0 )); then
	echo "Usage: $0 commit message"
	exit 1
fi

git add .
git commit -m "$*"
git pull
git push
