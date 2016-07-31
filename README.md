# vagrant_webapp

#### Table of Contents

1. [Module Description](#module-description)
2. [Setup](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Module Description
This module deploys a web application using Tomcat server and Postgres database.
It manages only required resources for deploying web applications.

## Setup
This module depends on:

Softwares:
- Vagrant
- Virtualbox
- r10k
- Puppet (3.7.2 or higher)

Modules:
- [tomcat](https://github.com/puppetlabs/puppetlabs-tomcat.git)
- [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib.git)
- [staging](https://github.com/nanliu/puppet-staging.git)
- [archive](https://github.com/voxpupuli/puppet-archive)
- [java8](https://github.com/Spantree/puppet-java8.git)
- [apt](https://github.com/puppetlabs/puppetlabs-apt.git)
- [postgresql](https://github.com/puppetlabs/puppetlabs-postgresql.git)
- [concat](https://github.com/puppetlabs/puppetlabs-concat.git)


To use this module, follow these steps:

1. Clone the repository:
```Puppet
git clone https://github.com/giuliana-bezerra/vagrant_webapp.git
```
2. Download dependencies using r10k:
```Puppet
cd puppet
r10k puppetfile install
```
3. Initialize vagrant (Vagrantfile directory):
```Puppet
vagrant up
```

## Usage
This module deploys a web application, so you have to provide a war file and
database initialization scripts. For this purpose, change hiera variables in
`common.yaml`. The module adopts the roles and profiles pattern, therefore the only
code needed inside the node declaration is the role import.

## Reference
Classes

- `role::webapp`: Role of web application server.
- `profile::tomcat`: Profile responsible for configuring Tomcat
server by creating an instance of it and deploying the application war file.
- `profile::postgres`: Profile responsible for configuring Postgres database
by creating the database using the provided configuration and executing initialization scripts.

Resources:
- `db_user`: Database user which manages Postgres database.
- `db_password`: Password for `db_user`.
- `database`: Database name.
- `init_script`: Sql script which initializes the database.
- `war_source`: Path for the web application war file.

## Limitations
None.

## Development
Developers can improve this module by creating new roles and profiles.
