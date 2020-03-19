#
# Cookbook:: ritsema-banck
# Recipe:: webserver
#

file '/etc/default/locale' do
  content 'LANG=en_GB.UTF-8'
end

#apache2_install 'default'
package 'apache2'

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action [:enable, :start]
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

package %w(php libapache2-mod-php)
package %w(php-bz2 php-ldap php-mysql php-zip)
package 'composer'

# php_pear %w(bz2 ldap bz2 mysqli zip) do
#   action :install
# end