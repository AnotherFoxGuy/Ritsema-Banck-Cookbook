#
# Cookbook:: Ritsema-Banck
# Recipe:: webserver
#

file '/etc/default/locale' do
  content 'LANG=en_GB.UTF-8'
end

apache2_install 'default'

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end

apache2_module 'ldap'
apache2_module 'authnz_ldap'

template 'ritsema-banck' do
  extend  Apache2::Cookbook::Helpers
  source 'ritsema-banck.conf.erb'
  path   "#{apache_dir}/sites-available/ritsema-banck.conf"
end
template 'intranet.ritsema-banck' do
  extend  Apache2::Cookbook::Helpers
  source 'intranet.ritsema-banck.conf.erb'
  path   "#{apache_dir}/sites-available/intranet.ritsema-banck.conf"
end

apache2_site 'ritsema-banck'
apache2_site 'intranet.ritsema-banck'

apache2_site '000-default' do
  action :disable
end

build_essential 'install build tools'

apt_package %w(unzip libldap2-dev libbz2-dev libzip-dev)

include_recipe 'php'

php_pear 'bz2' do
  action :install
end

php_pear 'ldap' do
  action :install
end

php_pear 'bz2' do
  action :install
end

php_pear 'mysqli' do
  action :install
end

php_pear 'zip' do
  action :install
end