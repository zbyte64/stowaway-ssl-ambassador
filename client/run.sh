#!/bin/bash

echo $PRIVATE_KEY > /etc/server.pem
echo $PUBLIC_KEY > /etc/client.crt
chmod 600 /etc/server.pem /etc/client.crt

echo `env | grep _TCP= | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat OPENSSL-CONNECT:\2:\3,cert=\/etc\/client.pem,cafile=\/etc\/server.crt TCP4-LISTEN:\1,fork,reuseaddr \&/'`

env | grep _TCP= | sed 's/.*_PORT_\([0-9]*\)_TCP=tcp:\/\/\(.*\):\(.*\)/socat OPENSSL-CONNECT:\2:\3,cert=\/etc\/client.pem,cafile=\/etc\/server.crt TCP4-LISTEN:\1,fork,reuseaddr \&/' | sh
