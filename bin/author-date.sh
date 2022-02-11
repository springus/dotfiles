#!/bin/bash

if [ $# != 1 ] ; then
  echo "引数の数が等しくありません"
  exit 1
fi

if [ ! -e $1 ] ;then
  echo "引数の種類が正しくありません。"
  echo "引数に指定できるのはファイルのみです。"
  exit 1
fi

file=$1

format_info="/*
 *
 * author: springus
 * created:$(date '+%Y/%-m/%-d %H:%M:%S')
 * Welcome to my coding space
 *
*/
"
echo "$format_info" > "$file"
