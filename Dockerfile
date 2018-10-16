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

ADD https://oss.sonatype.org/content/repositories/releases/net/sourceforge/plantuml/plantuml/1.2018.9/plantuml-1.2018.9.jar /usr/local/bin/plantuml.jar

COPY exec.sh /usr/local/bin/

ENV PLANTUML_LIMIT_SIZE=4096

ENTRYPOINT ["/usr/local/bin/exec.sh"]

CMD ["-h"]
