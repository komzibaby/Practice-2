#!/bin/bash

N=8

#To Parse arguments
while getopts ":dn:" opt; do
  case ${opt} in
    d ) list_all=true ;;
    n ) N=$OPTARG ;;
    \? ) echo "Usage: $0 [-d] [-n N] directory" 1>&2
         exit 1
         ;;
  esac
done
shift $((OPTIND -1))

# directory argument
if [ -z "$1" ]; then
  echo "Please provide a directory path."
  exit 1
fi

# To Check disk usage and list directories/files accordingly
if [ "$list_all" = true ]; then
  du -ah --max-depth=1 "$1" | sort -rh | head -n "$N"
else
  du -h --max-depth=1 "$1" | sort -rh | head -n "$N"
fi

