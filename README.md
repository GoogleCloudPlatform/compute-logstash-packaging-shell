## Logstash Packaging

Scripts to create Debian packages for [Logstash](http://logstash.net) installation.

This package provides 3 scripts:

1. package-common.sh: downloads logstash 1.2.21 and packages it up into a
.deb file with all the common files to be used across server and shipper.

2. package-shipper.sh: creates a Debian package with a shipper configuration.

   Once installed, update the configuration file below to point to the server:

     /etc/logstash/syslog-shipper.conf

3. package-server: creates a Debian package with a server configuration.

   This package works out of the box if you have both ElasticSearch and Redis
   running locally. In case any or both are remote, update the following file:

     /etc/logstash/syslog-redis-server.conf

NOTE: shipper and server packages conflict and cannot be installed on
the same host.

Flags to the scripts can be seen by running with with option "-?".

Author: Rodrigo De Castro <rdc@google.com>

## Project setup, installation, and configuration

1. git clone https://github.com/GoogleCloudPlatform/compute-logstash-packaging-shell.git

   This command clones repository locally.
2. ./package-common.sh

   It creates the common Debian package used by server and shipper
3. ./package-server.sh

   It creates the server Debian package
4. ./package-shipper.sh

   It creates the shipper Debian package

## Contributing changes

* See CONTRIB.md

## Licensing

* See LICENSE
