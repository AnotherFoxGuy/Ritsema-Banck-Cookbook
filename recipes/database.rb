# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: database
#

cookbook_file '/usr/bin/mysql_install_db' do
  source 'mysql_install_db'
  owner 'root'
  group 'root'
  mode 0o777
end

mysql_service 'default' do
  package_name 'mysql-server'
  version '8.0'
  socket '/var/run/mysqld/mysqld.sock'
  initial_root_password node['mysql']['rootpassword']
  action %i[create start]
end

mysql_client 'default' do
  package_name 'mysql-client'
  version '8.0'
  action :create
end

execute 'mysqlinport' do
  command "mysql -u\"root\" -p\"#{node['mysql']['rootpassword']}\" < /tmp/dump.sql"
  creates '/var/lib/mysql/ritsema_banck/hypotheeken.ibd'
  sensitive true
  action :nothing
end

template '/tmp/dump.sql' do
  source 'dump.sql'
  notifies :run, 'execute[mysqlinport]', :immediately
  sensitive true
end
