# frozen_string_literal: true

name 'ritsema-banck'
maintainer 'Edgar'
maintainer_email 'Edgar@AnotherFoxGuy.com'
license 'All Rights Reserved'
description 'Installs/Configures ritsema-banck'
version '1.0.6'
chef_version '>= 14.0'

depends 'apache2'
depends 'openldap'
depends 'mysql'
depends 'firewall'
depends 'fail2ban'
