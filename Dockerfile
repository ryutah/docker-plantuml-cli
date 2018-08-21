FROM openjdk:10-jre-slim

ENV LANGUAGE=en_US
ENV LANG=C.UTF-8

ARG BUILD_DEPENDENCIES=wget

RUN apt-get update \
 && apt-get install -y ${BUILD_DEPENDENCIES} \
 && apt-get install -y graphviz

RUN wget https://oscdl.ipa.go.jp/IPAexfont/ipaexg00301.zip \
 && unzip ipaexg00301.zip \
 && mv ipaexg00301/ipaexg.ttf /usr/share/fonts/ \
 && rm ipaexg00301.zip

RUN apt-get remove -y ${BUILD_DEPENDENCIES}

WORKDIR /home

COPY ./plantuml.1.2018.9.jar /usr/local/bin/plantuml.jar

ENTRYPOINT ["java", "-jar", "/usr/local/bin/plantuml.jar"]

CMD ["-h"]
