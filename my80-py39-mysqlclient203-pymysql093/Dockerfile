FROM quay.io/ansible/ubuntu2004-test-container:main
# ubuntu2004 comes with mysql-client-8

# iproute2  # To grab docker network gateway address
# python3.9-dev                # Reqs for mysqlclient
# default-libmysqlclient-dev   # Reqs for mysqlclient
# build-essential              # Reqs for mysqlclient
RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt upgrade -y --no-install-recommends && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    python3.9 \
    python3.9-dev \
    mysql-client \
    iproute2 \
    default-libmysqlclient-dev \
    build-essential

RUN python3.9 -m pip install --disable-pip-version-check --no-cache-dir mysqlclient==2.0.3 pymysql==0.9.3

ENV container=docker
CMD ["/sbin/init"]
