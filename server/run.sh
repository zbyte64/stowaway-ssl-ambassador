#!/bin/bash

echo $PRIVATE_KEY > /etc/server.pem
echo $PUBLIC_KEY > /etc/client.crt
chmod 600 /etc/server.pem /etc/client.crt

echo `env | grep _TCP= | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat OPENSSL-LISTEN:\1,fork,reuseaddr,cert=\/etc\/server.pem,cafile=\/etc\/client.crt TCP4:\2:\3 \&/'`

env | grep _TCP= | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat OPENSSL-LISTEN:\1,fork,reuseaddr,cert=\/etc\/server.pem,cafile=\/etc\/client.crt TCP4:\2:\3 \&/' | sh
