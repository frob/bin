#!/bin/sh
# Wrapper for Python helper scrips.

subscript=$1
bindirectory="/Users/`whoami`/bin/python"

# Check for command and run it if it exists.
if [ -z "$subscript" ] || [ ! -f "$bindirectory/$subscript.sh" ]; then
  echo 'Unknown command';
  [[ $PS1 ]] && return 2 || exit 2;
else
  . $bindirectory/$subscript.sh "$@";
fi
