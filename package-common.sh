#!/bin/bash
VERSION=1.1.10
CURRENT_DIR=$PWD
MAINTAINER="<lesspublic@gmail.com>"
JAR_FILE=$CURRENT_DIR/usr/share/logstash/logstash.jar

cd ..

if [ ! -f "$JAR_FILE" ]; then
  wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O $JAR_FILE  
fi

fpm -n logstash-common -v $VERSION -a all -C $CURRENT_DIR -m $MAINTAINER --pre-install $CURRENT_DIR/logstash.preinstall --post-install $CURRENT_DIR/logstash.postinstall --description "Logstash Open Source Log Management - Common" --url 'http://www.logstash.net/' -t deb --config-files etc/default/logstash -s dir etc/default/logstash etc/init.d $JAR_FILE var
