FROM openjdk:8
RUN apt-get update -y && apt-get install -y \
        ssh \
        pdsh
ENV VERSION 3.3.0
#RUN curl -O https://downloads.apache.org/hadoop/common/hadoop-$VERSION/hadoop-$VERSION.tar.gz
COPY ./hadoop-$VERSION.tar.gz /opt/hadoop-$VERSION.tar.gz
RUN tar xf /opt/hadoop-$VERSION.tar.gz && \
        rm /opt/hadoop-$VERSION.tar.gz
ENV HADOOP_HOME /opt/hadoop-$VERSION
ENV PATH $PATH:/opt/hadoop-$VERSION/bin
CMD ["hadoop"]
