# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: database
#

mysql_service 'default' do
  package_name 'mysql-server'
  initial_root_password node['mysql']['rootpassword']
  action [:create, :start]
end

mysql_client 'default' do
  package_name 'mysql-client'
  action :create
end

execute 'mysqlinport' do
  command "mysql -u\"root\" -p\"#{node['mysql']['rootpassword']}\" < /tmp/dump.sql"
  creates '/var/lib/mysql/ritsema_banck/hypotheeken.ibd'
  sensitive true
  action :nothing
end

cookbook_file '/tmp/dump.sql' do
  source 'dump.sql'
  notifies :run, 'execute[mysqlinport]', :immediately
end
