FROM progrium/busybox

MAINTAINER Last Khajiit version: 0.2

# Udate wget to support SSL
RUN opkg-install wget
# Get and install Java
RUN ( wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jre.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz &&   gunzip /tmp/jre.tar.gz && cd /opt && tar xf /tmp/jre.tar && rm /tmp/jre.tar)
# Link Java into use, wget-ssl updates libpthread which causes Java to break
RUN ln -sf /lib/libpthread-2.18.so /lib/libpthread.so.0 && ln -s /opt/jre1.8.0_40/bin/java /usr/bin/java

# Copy prebuilded vkb distributive from folder with Dockerfile
RUN mkdir /var/apps
#ADD vkb /var/apps
#ADD vkb/conf /var/apps/vkb
COPY . /var/apps
WORKDIR /var/apps/vkb
EXPOSE 8080
CMD java -Dtinylog.configuration=/var/apps/vkb/conf/tinylog.properties -jar vkb-1.0.jar
