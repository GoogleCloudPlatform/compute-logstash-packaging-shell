
1) clone this repository

2) install Jordan Sissel's FPM with gem

    gem install fpm

3) run logstash-packaging/package.sh

or

3) download the all inclusive logstash jar

    cd logstash-packaging
    wget http://semicomplete.com/files/logstash/logstash-1.1.7-monolithic.jar -O usr/share/logstash/logstash.jar

4) run the following command:

    cd ..
    fpm -n logstash -v 1.1.7 -d default-jre -a all -C logstash-packaging -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall  --post-install logstash-packaging/logstash.postinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb -s dir etc usr var

