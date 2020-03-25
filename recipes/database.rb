# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: database
#

mariadb_server_install 'MariaDB Server install' do
  password node['mariadb']['rootpassword']
  action %i[install create]
end

mariadb_database node['mariadb']['database'] do
  host '127.0.0.1'
  password node['mariadb']['rootpassword']
  action :create
end

mariadb_user node['mariadb']['user'] do
  ctrl_password node['mariadb']['rootpassword']
  password node['mariadb']['password']
  host '%'
  action :create
end

# # Query a database
# mariadb_database 'flush the privileges' do
#   sql 'flush privileges'
#   action :query
# end

execute 'mysqlinport' do
  command "mysql -u\"root\" -p\"#{node['mariadb']['rootpassword']}\" < /tmp/dump.sql"
  creates '/var/lib/mysql/ritsema_banck/hypotheeken.ibd'
  sensitive true
  action :nothing
end

cookbook_file '/tmp/dump.sql' do
  source 'dump.sql'
  notifies :run, 'execute[mysqlinport]', :immediately
end
