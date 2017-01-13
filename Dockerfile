FROM java:8-jre

ENV TOMEE_VERSION 7.0.2
ENV TOMEE_DISTRIBUTION plus

ENV TOMEE_URL http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/$TOMEE_VERSION/apache-tomee-$TOMEE_VERSION-$TOMEE_DISTRIBUTION.tar.gz
ENV TOMEE_HOME /opt/tomee
ENV TOMEE_PORT 8080

WORKDIR /opt

RUN wget -O - $TOMEE_URL | tar zxf - && \
    mv /opt/apache-tomee-$TOMEE_DISTRIBUTION-$TOMEE_VERSION $TOMEE_HOME

ENV PATH $TOMEE_HOME/bin:$PATH

WORKDIR $TOMEE_HOME

EXPOSE $TOMEE_PORT
CMD ["catalina.sh", "run"]
