#!/bin/bash
VERSION=1.1.13
CURRENT_DIR=$PWD
MAINTAINER="<lesspublic@gmail.com>"
FORCE=

usage()
{
cat << EOF
usage: $0 options

This script create a logstash shipper package.

OPTIONS:
   -f      Force package creation even if file exists
EOF
}

while getopts "f" OPTION
do
  case $OPTION in
    f)
      FORCE=-f
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

cd ..

fpm $FORCE -n logstash-server -v $VERSION -a all -C $CURRENT_DIR -m $MAINTAINER --depends logstash-common --conflicts logstash-shipper --pre-install $CURRENT_DIR/logstash.preinstall --post-install $CURRENT_DIR/logstash.postinstall --description "Logstash Open Source Log Management - Server" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog-redis-server.conf -s dir etc/logstash/syslog-redis-server.conf