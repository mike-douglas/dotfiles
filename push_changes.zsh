#!/bin/zsh

ssh ${1} rm -rf .home && ssh ${1} mkdir -p .home && git archive master | ssh ${1} tar -vx -C .home
