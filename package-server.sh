#!/bin/bash
VERSION=1.1.10
CURRENT_DIR=$PWD
cd ..
#git clone git://github.com/Yuav/logstash-packaging.git --depth=1

JAR_FILE=$CURRENT_DIR/usr/share/logstash/logstash.jar

if [ ! -f "$JAR_FILE" ]; then
  wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O $JAR_FILE  
fi

#wget https://logstash.objects.dreamhost.com/release/logstash-${VERSION}-flatjar.jar
fpm -n logstash-server -v $VERSION -a all -C $CURRENT_DIR -m "<lesspublic@gmail.com>" --conflicts logstash-shipper --pre-install $CURRENT_DIR/logstash.preinstall --post-install $CURRENT_DIR/logstash.postinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog-server.conf --config-files etc/default/logstash -s dir etc/default/logstash etc/init.d etc/logstash/syslog-server.conf usr/share/logstash/logstash.jar var
