#
# Cookbook:: ritsema-banck
# Recipe:: website
#

app_dir = '/var/www/'

directory app_dir do
  recursive true
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end

composer_project "/var/www/" do
  dev false
  action :install
end