#!/bin/sh
# Add a nginx drupal conf

host=$1
loc=$2

if [ -z "$host" ]; then
  echo 'Please Specify a host name';
  [[ $PS1 ]]&&return 2||exit 2;
fi

cp /usr/local/etc/nginx/sites-available/TEMPLATE /usr/local/etc/nginx/sites-available/$host
perl -pi -e s,TEMPLATE,$host,g /usr/local/etc/nginx/sites-available/$host

# if the second argument is passed then it will use that to specify the webroot
if [ -n $loc ]; then
  perl -pi -e s,/Users/`whoami`/repos/drupal/$host,$loc,g /usr/local/etc/nginx/sites-available/$host
fi

cd /usr/local/etc/nginx/sites-enabled && ln -s ../sites-available/$host && sudo nginx -t && sudo nginx -s reload
