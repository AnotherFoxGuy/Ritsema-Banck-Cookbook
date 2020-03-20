#
# Cookbook:: ritsema-banck
# Recipe:: website
#

app_dir = '/var/www/'

directory app_dir do
  extend Apache2::Cookbook::Helpers
  recursive true
  mode '0755'
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end

composer_project "/var/www/" do
  dev false
  action :install
end