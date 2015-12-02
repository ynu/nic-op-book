# 创建CA证书
This article describes how to create your own CA and issue your own server certificates.

## As root
`sudo su`

## Create CA's directory tree
`mkdir -m 0755 myCA myCA/private myCA/certs myCA/newcerts  myCA/crl`

### Change our directory
`cd myCA`

## Initial openssl configuration

### Copy default configuration file to our directory
`cp /etc/ssl/openssl.cnf openssl.my.cnf`

### This file don't need to be world readable, so we change its attributes
`chmod 0600 openssl.my.cnf`

### Create a file that will serve as a database for openssl
`touch index.txt`

### Create a file that contains the next certificate's serial number. Sinse we have not create any certificates yet, we set it to "01"
`echo '01' > serial`

## Create the CA Certificate and Key

### Create your CA's Certificate and Private Key
`openssl req -config openssl.my.cnf -new -x509 -extensions v3_ca -keyout private/myca.key -out certs/myca.crt -days 1825`

### Restrict access to the private key file so that only root can read it.
`chmod 0400 private/myca.key`

## Modify your openssl configuration file

### Open your openssl configuration in your favourite text editor, find the following part(around line 40), and modify it:

```
[ CA_default ]

dir     = .                # <--CHANGE THIS
certs       = $dir/certs
crl_dir     = $dir/crl
database    = $dir/index.txt
#unique_subject = no

new_certs_dir   = $dir/newcerts

certificate = $dir/certs/myca.crt   # <--CHANGE THIS
serial      = $dir/serial
#crlnumber  = $dir/crlnumber

crl     = $dir/crl.pem
private_key = $dir/private/myca.key    # <--CHANGE THIS
RANDFILE    = $dir/private/.rand

x509_extensions = usr_cert
```

## Create a Server certificate
### Generate a Certificate Request
`openssl req -config openssl.my.cnf -new -nodes -keyout private/server.key -out server.csr -days 1825`

### Set restrictive permissions on the private key
`chmod 0400 private/server.key`

### Sign the Certificate Request
`openssl ca -config openssl.my.cnf -policy policy_anything -out certs/server.crt -infiles server.csr`

### Verify the certificate
`openssl x509 -subject -issuer -enddate -noout -in certs/server.crt`
Or
`openssl x509 -in certs/server.crt -noout -text`

### Verify the certificate is valid for server authentication
`openssl verify -purpose sslserver -CAfile certs/myca.crt certs/server.crt`

## Server certificate and private key in one file
`cat certs/server.crt private/server.key > private/server-key-cert.pem`

And restrict access to the final file:
`chmod 0400 private/server-key-cert.pem`