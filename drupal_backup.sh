#!/bin/sh
# Backup a drupal site to a location

drushalias=$1
location=$2
prettydate=`$(date '+%Y-%m-%d-%H-%M-%S')--$(git log --pretty=format:'%h' -n1)`

if [ -z "$drushalias" ]; then
  echo 'Please Specify a drush alias';
  [[ $PS1 ]]&&return 2||exit 2;
fi

if [ -z "$location" ]; then
  location=default
fi

mkdir -p ~/Documents/drush-dumps/$location

# @TODO check to see if the dump already exists. Don't overwrite existing
# backup files.

drush $drushalias sql-dump > ~/Documents/drush-dumps/$location/backup--$prettydate.sql
