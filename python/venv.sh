#!/bin/sh
# Work with the virtualenv.

op=$2

# Check for command and run it if it exists.
if [ -z "$op" ]; then
  echo 'venv Expects paramaters (at least 1)';
  [[ $PS1 ]] && return 2 || exit 2;
fi

if [ "$op" == 'activate' ]; then
  echo "activate";
fi

if [ "$op" == 'deactivate' ]; then
  echo "deactivate";
fi

# @TODO Return the actual return code.
