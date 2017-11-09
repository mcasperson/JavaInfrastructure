#!/usr/bin/env bash
cd /tmp
wget http://apache.mirror.amaze.com.au/apr/apr-1.6.3.tar.gz
tar -zxvf apr-1.6.3.tar.gz
cd apr-1.6.3
./configure
make
make install

cd /tmp
wget http://apache.mirror.amaze.com.au/apr/apr-util-1.6.1.tar.gz
tar -zxvf apr-util-1.6.1.tar.gz
cd apr-util-1.6.1
./configure --with-apr=/usr/local/apr
make
make install

cd /tmp
wget http://apache.melbourneitmirror.net/tomcat/tomcat-connectors/native/1.2.14/source/tomcat-native-1.2.14-src.tar.gz
tar -zxvf tomcat-native-1.2.14-src.tar.gz
cd tomcat-native-1.2.14-src/native
./configure --with-apr=/usr/local/apr --with-java-home=/usr/lib/jvm/java-1.8.0-openjdk
make
make install