#
# Cookbook:: Ritsema-Banck
# Recipe:: website
#


directory app_dir do
  recursive true
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end

archive_file 'Precompiled.zip' do
  path '/tmp/Precompiled.zip'
  destination '/var/www/'
end


composer_project "/var/www/" do
  dev false
  prefer_dist false
  action :install
end