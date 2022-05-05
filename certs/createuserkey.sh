#!/bin/bash

CLIENT_ID=client
CLIENT_SERIAL=01 
#when creating new user make sure that serial is unique
openssl ecparam -genkey -name secp256r1 | openssl ec -out ${CLIENT_ID}.key
openssl req -new -key ${CLIENT_ID}.key -out ${CLIENT_ID}.csr
#password should be empty
openssl x509 -req -days 3650 -in ${CLIENT_ID}.csr -CA ca.pem -CAkey ca.key -set_serial ${CLIENT_SERIAL} -out ${CLIENT_ID}.pem
cat ${CLIENT_ID}.key ${CLIENT_ID}.pem ca.pem > ${CLIENT_ID}.full.pem
#OPTIONAL:
openssl pkcs12 -export -out ${CLIENT_ID}.full.pfx -inkey ${CLIENT_ID}.key -in ${CLIENT_ID}.pem -certfile ca.pem
#remember passoword and you will pass it with pfx file
#### passw: partnerhelper2022 ####