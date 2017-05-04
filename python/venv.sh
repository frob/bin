#!/bin/bash
# Work with the virtualenv.

op=$2

activate_bash () {
  if [ -f ".venv/bin/activate" ]; then
    /bin/bash -c ". .venv/bin/activate; exec /bin/bash -i" ;

    # This wont run until after the activation is complete.
    echo "Viretual Environment Deactivated";

  else
    printf \
      'There was a problem with the activation.\n' \
      'No activation file found, are you sure this is a python project?\n';
    exit 1;
  fi
}

# Check for command and run it if it exists.
if [ -z "$op" ]; then
  echo 'venv Expects paramaters (at least 1)';
  exit 1;
fi

# Switch to the virtual environment.
if [ "$op" == 'activate' ]; then
  echo "Activating ...";
  activate_bash
fi
