#!/bin/bash
VERSION=1.1.10
CURRENT_DIR=$PWD
cd ..
#git clone git://github.com/Yuav/logstash-packaging.git --depth=1
wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O logstash-packaging/usr/share/logstash/logstash.jar
#wget https://logstash.objects.dreamhost.com/release/logstash-${VERSION}-flatjar.jar
fpm -n logstash -v $VERSION -a all -C $CURRENT_DIR -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog.conf --config-files etc/default/logstash -s dir etc usr var
