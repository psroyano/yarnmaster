FROM uhadoop

LABEL maintainer="Pedro Santos" \
      version="1.0"

#Instalación Apache Flume 1.9.0
RUN wget https://ftp.cixug.es/apache/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz && \
    tar -xvzf apache-flume-1.9.0-bin.tar.gz -C /app && \
    rm apache-flume-1.9.0-bin.tar.gz && \
    rm /app/apache-flume-1.9.0-bin/lib/guava-11.0.2.jar #incompatiblidad
ENV FLUME_HOME /app/apache-flume-1.9.0-bin 
ENV PATH $PATH:$FLUME_HOME/bin


#Copiamos dataset 
COPY ./spooldir /spooldir

#Copiamos configuración agente flume
COPY ./agente.conf /agente.conf

EXPOSE 8088 19888
