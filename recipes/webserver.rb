# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: webserver
#

file '/etc/default/locale' do
  content 'LANG=en_GB.UTF-8'
end

# https://launchpad.net/~ondrej/+archive/ubuntu/php/
apt_repository 'ondrej-php' do
  uri          'ppa:ondrej/php'
end
apt_repository 'ondrej-apache2' do
  uri          'ppa:ondrej/apache2'
end

# apache2_install 'default'
package 'apache2'

apache2_module 'headers'
apache2_module 'ldap'
apache2_module 'authnz_ldap'
apache2_module 'ssl'

template 'ritsema-banck' do
  extend  Apache2::Cookbook::Helpers
  source 'ritsema-banck.conf'
  path   "#{apache_dir}/sites-available/001-ritsema-banck.conf"
end
template 'intranet.ritsema-banck' do
  extend Apache2::Cookbook::Helpers
  source 'intranet.ritsema-banck.conf'
  path   "#{apache_dir}/sites-available/intranet.ritsema-banck.conf"
end

apache2_site '001-ritsema-banck'
apache2_site 'intranet.ritsema-banck'

apache2_site '000-default' do
  action :disable
end

package %w[php7.4 libapache2-mod-php7.4]
package %w[php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-ldap php7.4-soap php7.4-zip php7.4-intl]
package 'composer'

package %w[libapache2-mod-security2 modsecurity-crs]

apache2_module 'security2'

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action %i[enable restart]
end
