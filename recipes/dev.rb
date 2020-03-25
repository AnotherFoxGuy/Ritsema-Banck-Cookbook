# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: dev
#

package %w[perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions unzip shared-mime-info python]

remote_file '/tmp/webmin.deb' do
  source 'http://prdownloads.sourceforge.net/webadmin/webmin_1.941_all.deb'
  mode '0755'
end

dpkg_package 'webmin.deb' do
  source '/tmp/webmin.deb'
  action :install
end


include_recipe 'ritsema-banck::security'

# open webmin port
firewall_rule 'webmin' do
  port 10_000
  command :allow
end

remote_file '/var/www/src/adminer.php' do
  source 'https://github.com/vrana/adminer/releases/download/v4.7.6/adminer-4.7.6.php'
  mode '0755'
end
