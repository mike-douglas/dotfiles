#!/bin/zsh

ssh ${1} rm -rf .home && ssh ${1} mkdir -p .home && git archive main | ssh ${1} tar -vx -C .home
