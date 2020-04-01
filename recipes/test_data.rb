# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: test_data
#

package 'nano'

directory '/var/www/src/' do
  recursive true
  action :create
end

directory '/var/www/intranet/' do
  action :create
end

directory '/var/www/lib/' do
  action :create
end

file '/var/www/src/index.php' do
  content '<html>This is a placeholder for the home page.</html>'
end

file '/var/www/intranet/index.php' do
  content '<html>This is a placeholder for the intranet page.</html>'
end

file '/var/www/lib/hacked.txt' do
  content "Hacked!!!! #{node['hostname']}"
end

file '/var/www/composer.json' do
  content '{ "autoload": { "psr-4": { "RitsemaBanck\\\\": "lib" }}, "require": { "directorytree/ldaprecord": "^1.2" }}'
end

cookbook_file '/var/www/src/test-ldap.php' do
  source 'test-ldap.php'
end

cookbook_file '/var/www/src/test-mysql.php' do
  source 'test-mysql.php'
end
