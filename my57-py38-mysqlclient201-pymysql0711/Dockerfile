FROM quay.io/ansible/ubuntu1804-test-container:main

# iproute2                     # To grab docker network gateway address
# python3-dev                  # Reqs for mysqlclient
# default-libmysqlclient-dev   # Reqs for mysqlclient
# build-essential              # Reqs for mysqlclient
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y --no-install-recommends && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3.8 \
    mysql-client \
    iproute2 \
    python3-dev \
    default-libmysqlclient-dev \
    build-essential

RUN python3.8 -m pip install --disable-pip-version-check --no-cache-dir pymysql==0.7.11 mysqlclient==2.0.1

ENV container=docker
CMD ["/sbin/init"]
