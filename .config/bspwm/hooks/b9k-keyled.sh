#!/bin/bash

idle=false
dimtime=120000
offtime=300000

while true; do
  idletime=$(xprintidle)
  # echo "$idletime"  # just for debug purposes.
  if [[ $idle = false && $idletime -gt $dimtime ]] ; then
    msi-perkeyrgb -s 000000
    og=$(xbacklight -get)
    xbacklight -set 5
    idle=true
  fi

  if [[ $idle = true && $idletime -gt $offtime ]]; then
    xbacklight -set 0
  fi

  if [[ $idle = true && $idletime -lt $dimtime ]] ; then
    msi-perkeyrgb -s aa0000
    xbacklight -set $og
    idle=false
  fi
  sleep 1      # polling interval

done

