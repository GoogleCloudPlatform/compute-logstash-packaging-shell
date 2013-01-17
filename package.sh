#!/bin/bash
VERSION=1.1.9
cd ..
git clone git://github.com/Yuav/logstash-packaging.git
wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O logstash-packaging/usr/share/logstash/logstash.jar
#wget https://logstash.objects.dreamhost.com/release/logstash-1.1.8-flatjar.jar
fpm -n logstash -v $VERSION -d default-jre -a all -C logstash-packaging -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb -s dir etc usr var
