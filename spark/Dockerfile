FROM ftopal/machine-learning:py37

# Install java8
RUN apt-get update --fix-missing && \
    apt-get upgrade -y openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

# Spark dependencies
ENV SPARK_VERSION=2.4.5 \
    HADOOP_VERSION=2.7 \
    APACHE_SITE=https://downloads.apache.org

RUN wget -q ${APACHE_SITE}/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz &&\
    tar xzf "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" -C /usr/local && \
    rm "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"

ENV SPARK_HOME="/usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}"

WORKDIR /notebooks

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root"]
