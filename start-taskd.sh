#!/bin/bash

if [ ! -f $TASKDDATA/config ]; then
  # Generate certs
  pushd /etc/pki/taskd
  ./generate
  popd

  # Generate initial config file
  /usr/bin/taskd init
  /usr/bin/taskd config server localhost:53589 
  /usr/bin/taskd config log /dev/stdout
  /usr/bin/taskd config ca.cert/etc/pki/taskd/ca.cert.pem
  /usr/bin/taskd config server.cert /etc/pki/taskd/server.cert.pem
  /usr/bin/taskd config server.key /etc/pki/taskd/server.key.pem
  /usr/bin/taskd config server.crl /etc/pki/taskd/server.crl.pem

fi

/usr/bin/taskd diagnostics

/usr/bin/taskd server --debug
