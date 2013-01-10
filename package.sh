#!/bin/bash
VERSION=1.1.7
git clone git://github.com/Yuav/logstash-packaging.git
#cd logstash-packaging
wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-flatjar.jar -O logstash-packaging/usr/share/logstash/logstash.jar
fpm -n logstash -v $VERSION -d default-jre -a all -C logstash-packaging -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall  --post-install logstash-packaging/logstash.postinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb -s dir etc usr var
