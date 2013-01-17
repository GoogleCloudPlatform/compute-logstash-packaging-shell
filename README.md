Running package.sh will download logstash 1.1.9, and package it into a .deb 
file. Alternatively, you can do it manually:

1) clone this repository

2) install Jordan Sissel's FPM with gem

    gem install fpm

3) download the all inclusive logstash jar

    cd logstash-packaging
    wget http://logstash.objects.dreamhost.com/release/logstash-1.1.9-flatjar.jar -O usr/share/logstash/logstash.jar

4) run the following command:

    fpm -n logstash -v 1.1.9 -d default-jre -a all -C logstash-packaging -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb -s dir etc usr var

