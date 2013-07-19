#!/bin/bash
VERSION=1.1.13
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MAINTAINER="<lesspublic@gmail.com>"
JAR_FILE=usr/share/logstash/logstash.jar
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

if [ ! -f "$CURRENT_DIR/$JAR_FILE" ]; then
  wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O $CURRENT_DIR/$JAR_FILE
fi

fpm \
  $FORCE \
  -n logstash-common \
  -v $VERSION \
  -a all \
  -C $CURRENT_DIR \
  -m $MAINTAINER \
  --pre-install \
  $CURRENT_DIR/logstash.preinstall \
  --post-install $CURRENT_DIR/logstash.postinstall \
  --description "Logstash Open Source Log Management - Common" \
  --url 'http://www.logstash.net/' \
  -t deb \
  --config-files etc/default/logstash \
  -s dir etc/default/logstash etc/init.d $JAR_FILE var
