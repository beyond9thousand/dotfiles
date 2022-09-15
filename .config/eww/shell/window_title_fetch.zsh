#!/usr/bin/env zsh

xtitle -s | stdbuf -oL -eL uniq | cat
