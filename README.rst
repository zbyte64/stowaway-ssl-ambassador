Docker ambassador with ssl tunneling.


Environment Keys
================

SERVER_KEY (cat $FILENAME.pem)
CLIENT_KEY (cat $FILENAME.crt)


Generating Keys
===============

openssl genrsa -out $FILENAME.key 1024

openssl req -batch -nodes -new -key $FILENAME.key -x509 -days 3653 -out $FILENAME.crt

cat $FILENAME.key $FILENAME.crt > $FILENAME.pem
