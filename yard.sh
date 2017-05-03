#!/bin/sh
# Wrapper for Python helper scrips.

subscript=$1

# Check for command and run it if it exists.
if [ -z "$subscript" ] || [ ! -f "python/$subscript.sh" ]; then
  echo 'Unknown command';
  [[ $PS1 ]] && return 2 || exit 2;
else
  . python/$subscript.sh;
fi
