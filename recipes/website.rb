# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: website
#

directory '/var/www/html/' do
  recursive true
  action :delete
end

execute 'Install composer deps' do
  cwd '/var/www/'
  creates '/var/www/vendor/autoload.php'
  command '/usr/bin/composer install --no-dev --no-interaction --no-ansi --optimize-autoloader'
  live_stream true
end

directory '/var/www/' do
  extend Apache2::Cookbook::Helpers
  recursive true
  mode '0755'
  owner   lazy { default_apache_user }
  group   lazy { default_apache_group }
end
