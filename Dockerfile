FROM java:7

MAINTAINER Last Khajiit version: 0.1

RUN mkdir /var/apps
#ADD ./vkb /var/apps
COPY . /var/apps
WORKDIR /var/apps
EXPOSE 8080
CMD java -Dtinylog.configuration=conf/tinylog.properties -jar vkb-1.0.jar
