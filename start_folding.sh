#!/bin/bash

team="--team=${FAH_TEAM:-0}"
user="--user=${FAH_USER:-Anonymous}"
power="--power=${POWER:-medium}"
command_allow="--command-allow-no-pass=${COMMAND_ALLOW:-127.0.0.1}
web_allow="--web-allow=${WEB_ALLOW:-0/0}"
allow="--allow=${WEB_ALLOW:-0/0}"
gpu="--gpu=${GPU:-false}"
smp="--smp=${SMP:-false}"

if [[ -z "${FAH_PASSKEY}" ]]; then
  passkey=""
else
  passkey="--passkey=${FAH_PASSKEY}"
fi

cmd="/usr/bin/FAHClient ${team} ${user} ${power} ${command_allow} ${web_allow} ${allow} ${gpu} ${smp} ${passkey}"
echo "${cmd} $@"
exec $cmd $@
