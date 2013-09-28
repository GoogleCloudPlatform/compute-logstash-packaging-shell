#!/bin/bash
VERSION=1.2.1
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
  #wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-flatjar.jar -O $CURRENT_DIR/$JAR_FILE

  # TODO(rdc): use official package (above) once LOGSTASH-1334 is fixed and
  # Google API client (+ Google plugins) can be used.
  wget http://commondatastorage.googleapis.com/logstash%2Flogstash-1.2.1-monolithic.jar -O $CURRENT_DIR/$JAR_FILE -O $CURRENT_DIR/$JAR_FILE
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
