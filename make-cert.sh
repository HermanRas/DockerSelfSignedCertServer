#!/bin/bash

# Vars
pwd=$(pwd)
domain=$1
date=$(date '+%Y-%m-%d_%H-%M-%S')

if [ $# -lt 1 ];
# if you forgot to set a domain
then
echo "make-cert.sh dev-server.local"
else
    if [ $# -gt 1 ];
    then
    # if you have more than one domain
    echo -e "Only one domain name supported \nmake-cert.sh dev-server.local"
    # all good generate Certs
    else
    echo "making cert for $domain"
    echo "cert will be droped in $pwd/certs"
    mkdir $pwd/certs/$domain
    docker run --rm --name servercerts \
      -v $pwd/certs:/certs \
      -e CA_SUBJECT="lab-ca.com" \
      -e CA_EXPIRE=1825 \
      -e SSL_EXPIRE=365 \
      -e SSL_KEY=/certs/$domain/$domain.key \
      -e SSL_CERT=/certs/$domain/$domain.pem \
      -e SSL_CSR=/certs/$domain/$domain.csr \
      -e SSL_IP=127.0.0.1 \
      -e SSL_DNS=$domain \
      -e SSL_SUBJECT=$domain \
      superseb/omgwtfssl
    touch $pwd/certs/$domain/$date.txt
    fi
fi
