#!/bin/sh
# Initialize a python project.

# Check if git is initialzed and if not initialize it.
if [ ! -d ".git" ]; then
  git init;
fi

# Check for a python gitignore.
if [ ! -f ".gitignore" ]; then
  curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore;
  git add .gitignore;
  git commit -m "initial commit";
fi

# Create the virtual environment.
virtualenv .venv;

if [ ! grep -FxQ .gitignore venv ]; then
  echo "# Ignore python virtual environment." >> .gitignore
  echo ".venv" >> .gitignore
fi
