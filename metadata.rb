# frozen_string_literal: true

name 'ritsema-banck'
maintainer 'Edgar'
maintainer_email 'Edgar@AnotherFoxGuy.com'
license 'All Rights Reserved'
description 'Installs/Configures ritsema-banck'
version '0.1.0'
chef_version '>= 14.0'

depends 'apache2'
depends 'openldap'
depends 'mariadb'
depends 'firewall'
