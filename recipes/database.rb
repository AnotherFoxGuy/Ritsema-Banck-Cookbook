#
# Cookbook:: ritsema-banck
# Recipe:: database
#

mariadb_pwsd = 'root123'

mariadb_server_install 'MariaDB Server install' do
  password mariadb_pwsd
  action [:install, :create]
end

mariadb_database 'ritsema_banck' do
  host '127.0.0.1'
  password mariadb_pwsd
  action :create
end

mariadb_user 'ritsema_banck' do
  ctrl_password mariadb_pwsd
  password 'kaas'
  database_name 'ritsema_banck'
  host '%'
  privileges [:all]
  action :create
end

# # Query a database
# mariadb_database 'flush the privileges' do
#   sql 'flush privileges'
#   action :query
# end


