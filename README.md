
1) clone this repository

2) install Jordan Sissel's FPM with gem

3) download the all inclusive logstash jar

    cd logstash-packaging
    curl -o usr/share/logstash/logstash.jar http://semicomplete.com/files/logstash/logstash-1.1.1-monolithic.jar

4) run the following command:

    cd ..
    fpm -n logstash -v 1.1.1~c2c+1 -d grok -d default-jre -a all -C logstash-packaging -m "<mathieu.bornoz@camptocamp.com>" --pre-install logstash-packaging/logstash.preinstall  --post-install logstash-packaging/logstash.postinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb -s dir etc usr var

