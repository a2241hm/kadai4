#!/bin/bash

#######################################
# shell name  : kadai4_test.sh
# Description : テストスクリプト
# Date        : 2021/08/06
#######################################


if [ $# -ne 2 ]; then
echo "input 2 argments" 1>&2 exit 1
fi

expr $1 + $2 > /dev/null 2>&1 
if [ $?-ge2 ]; then
	echo "input natural number" 1>&2
	exit 1
fi

if [ $1-eq$2 ]; then
	echo "$1 is equal to $2"
else
	echo "$1 is not equal to $2"
fi

