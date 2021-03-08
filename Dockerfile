FROM openjdk:8

# Spark

# Glue 2.0 support versions: https://docs.aws.amazon.com/ja_jp/glue/latest/dg/release-notes.html
ENV SPARK_VERSION 2.4.3
ENV HADOOP_VERSION 2.7
ENV SPARK_PACKAGE spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV SPARK_HOME /usr/spark-${SPARK_VERSION}
ENV PATH ${SPARK_HOME}/bin:$PATH

RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_PACKAGE}.tgz \
  && tar xzf ${SPARK_PACKAGE}.tgz \
  && mv ${SPARK_PACKAGE} ${SPARK_HOME} \
  && rm ${SPARK_PACKAGE}.tgz


# Python

# Glue 2.0 support versions: https://docs.aws.amazon.com/ja_jp/glue/latest/dg/release-notes.html
ENV PYTHON_VERSION 3.7

RUN apt-get update \
  && apt-get install --no-install-suggests --no-install-recommends --yes python${PYTHON_VERSION} \
  && rm -rf /var/lib/apt/lists/*


# Glue

ENV GLUE_LIB_VERSION 1.0

RUN wget -q https://github.com/awslabs/aws-glue-libs/archive/glue-${GLUE_LIB_VERSION}.zip \
  && unzip glue-${GLUE_LIB_VERSION}.zip \
  && rm glue-1.0.zip

RUN apt-get update \
  && apt-get install --no-install-suggests --no-install-recommends --yes zip maven \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /aws-glue-libs-glue-1.0/bin/glue-setup.sh \
  && /aws-glue-libs-glue-1.0/bin/glue-setup.sh

WORKDIR /app
