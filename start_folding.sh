#!/bin/bash

team="--team=${FAH_TEAM:-0}"
user="--user=${FAH_USER:-Anonymous}"
power="--power=${POWER:-medium}"
web_allow="--web-allow=${WEB_ALLOW:-0/0}"
allow="--allow=${WEB_ALLOW:-0/0}"
gpu="--gpu=${GPU:-false}"
smp="--smp=${SMP:-false}"

cmd="/usr/bin/FAHClient ${team} ${user} ${power} ${web_allow} ${allow} ${gpu} ${smp}"
echo "${cmd} $@"
exec $cmd $@