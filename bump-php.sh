#!/bin/sh

if [ ! -z "$1" ]; then
  # make sure we are up to date
  cd ~/aports && git pull

  # we want to abump php5
  echo "Bumping PHP to $1"
  cd ~/aports/main/php5 && abump php5-$1

  # build php5-redis
  cd ~/aports/testing/php5-redis && abuild -r
else
  echo "Usage: $0 5.6.28"
fi
