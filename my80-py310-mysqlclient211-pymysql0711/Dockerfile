FROM quay.io/ansible/ubuntu2204-test-container:main
# ubuntu2204 comes with mysql-client-8 and is first to include python3.10

# iproute2  # To grab docker network gateway address
RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt upgrade -y --no-install-recommends && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    mysql-client \
    iproute2

RUN python3.10 -m pip install --disable-pip-version-check --no-cache-dir mysqlclient==2.1.1 pymysql==0.7.11

ENV container=docker
CMD ["/sbin/init"]
