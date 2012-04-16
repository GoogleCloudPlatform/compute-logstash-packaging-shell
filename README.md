First off, you will need to install Jordan Sissel's FPM. gem install fpm should
do it.

You'll want to create a directory called logstash_packaging, and put the usr, etc,
and var dirs into it. You'll then want to get the all inclusive logstash jar and
name it logstash.jar. You'll place this file in the usr/share/logstash folder.

You will then run the following command:

fpm -n logstash -v 1.1.0.1yoursite1 -d grok -d default-jre -a all -C logstash_packaging/ -m "The Systems Group <systems@yoursite.com>" -t deb -s dir --pre-install ./logstash.preinstall  --post-install ./logstash.postinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/'

Make sure the first part of the version string matches with the actual LogStash
version.

Now put this in your repo and use my Puppet module for logstash.

???

Profit.
