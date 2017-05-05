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

install () {
  # If requirements.txt exists, install exactly what is in requirements.txt
  if [ -f "requirements.txt" ] && [ -f ".venv/bin/activate" ]; then
    # Install requirements.
    source .venv/bin/activate;
    if pip install -r requirements.txt; then
      echo 'Requirments installed.';
    else
      echo 'There was a problem installing requirements.';
      exit 1;
    fi
  elif [ -f "requirements.unlocked.txt" ] && [ -f ".venv/bin/activate" ]; then
    # Install requirements from unlocked requirements.
    source .venv/bin/activate;
    if pip install -r requirements.unlocked.txt; then
      echo 'Requirments installed. Creating Freeze file: requirements.txt';
      pip freeze > requirements.txt;
    else
      echo 'There was a problem installing requirements.';
      exit 1;
    fi
  else
    # Exit with an error if not in a venv.
    if [ ! -f ".venv/bin/activate" ]; then
      echo "Not an initialized virtual environment.";
      exit 1;
    fi

    # Exit without error if no requirements found.
    if [ ! -f "requirements.txt" ] || [ ! -f "requirements.unlocked.txt" ]; then
      echo "No requirements found. Are you sure you have a requirements file?";
    fi
  fi
}

# update () {
#   # Install dependencies from requirements.dev.txt and update requirements.txt
# pip install -U 'flask>=0.11'
# https://pip.readthedocs.io/en/stable/reference/pip_install/#pip-install-examples
# }

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

if [ "$op" == 'install' ]; then
  echo "Installing"
  install
  exit 0;
fi
