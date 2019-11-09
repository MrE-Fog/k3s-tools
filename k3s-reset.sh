#!/bin/bash
# reset k3s
NODES=$(echo node{1..4})

multipass exec node1 -- bash -c 'sudo sh /usr/local/bin/k3s-uninstall.sh'
multipass exec node1 -- bash -c 'sudo sh /usr/local/bin/k3s-killall.sh'

NODES=$(echo node{2..4})
for NODE in ${NODES}; do
multipass exec ${NODE} -- bash -c 'sudo sh /usr/local/bin/k3s-killall.sh'
multipass exec ${NODE} -- bash -c 'sudo sh /usr/local/bin/k3s-agent-uninstall.sh'
done