
# Community.mysql test-containers

Those images are used by the integrations tests of [ansible-collections/community.mysql](https://github.com/ansible-collections/community.mysql).

They contains the python connector for MySQL/MariaDB and a mysql-client/mariadb-client.

The python connector is used by community.mysql's plugins and the client is used to setup tests using ansible.builtin.command plugin.

Both packages takes time to install via pip and apt. This image has been created to avoid reinstalling them on each tests.

The bellow informations helps determine which containers to craft for our tests. We could install multiple Python per image. But I think it's best to be explicit.


## Availables packages for Ubuntu 18.04

  - python3.6 (Installed by default)
  - python3.7
  - python3.8
  - mysql-client-5.7
  - mariadb-client-10.1


## Availables packages for Ubuntu 20.04

  - python3.8 (Installed by default)
  - python3.9
  - mysql-client-8.0
  - mariadb-client-10.3


## Availables packages for Ubuntu 22.04

  - python3.10 (Installed by default)
  - python3.11
  - mysql-client-8.0
  - mariadb-client-10.6


## Mysqlclient compatibility with Python

By looking at the packages for Windows [here](https://pypi.org/simple/mysqlclient/) we can guess was version are available per Python version:

Python3.8:

- 2.0.1
- 2.0.2
- 2.0.3
- 2.1.0
- 2.1.1

Python 3.9:

- 2.0.2
- 2.0.3
- 2.1.0
- 2.1.1

Python 3.10:

- 2.1.0
- 2.1.1

Python 3.11:

- 2.1.1