#!/bin/bash

idle1=false
idleAfter=60000

while true; do
  idleTimeMillis=$(xprintidle)
  # echo "$idleTimeMillis"  # just for debug purposes.
  if [[ $idle1 = false && $idleTimeMillis -gt $idleAfter ]] ; then
    msi-perkeyrgb -s 000000
    xbacklight -dec 30
    idle1=true
  fi

  if [[ $idle1 = true && $idleTimeMillis -lt $idleAfter ]] ; then
    msi-perkeyrgb -s aa0000
    xbacklight -inc 30
    idle1=false
  fi
  sleep 1      # polling interval

done

