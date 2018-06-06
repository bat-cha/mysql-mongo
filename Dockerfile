FROM debian:jessie
LABEL maintainer="bat-cha <baptiste.chatrain@gmail.com>"


ENV MONGOSQL_AUTH_C_VERSION=v1.2.0

RUN apt-get update && apt-get install -y \
    mysql-client \
    libmysqlclient-dev \
    curl \
    libssl1.0.0 \
    && rm -rf /var/lib/apt/lists/* \
    && curl -LO https://github.com/mongodb/mongosql-auth-c/releases/download/${MONGOSQL_AUTH_C_VERSION}/mongosql-auth-linux-x86_64-ubuntu-1404-${MONGOSQL_AUTH_C_VERSION}.tgz \
    && tar xvzf mongosql-auth-linux-x86_64-ubuntu-1404-${MONGOSQL_AUTH_C_VERSION}.tgz \
    && mkdir -p /usr/lib/mysql/plugin \
    && mv mongosql-auth-linux-x86_64-ubuntu-1404/lib/mongosql_auth.so /usr/lib/mysql/plugin
