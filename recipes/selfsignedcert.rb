#
# Recipe:: selfsignedcert
#
# https://github.com/cgravier/selfsigned_certificate
# Copyright (C) 2013 Christophe Gravier, Universite Jean Monnet
#
# Licence : Apache 2.0
#

# install openssl if not present
package "openssl" do
  action :install
end

# create output dir
directory node['selfsigned_certificate']['destination'] do
  owner "root"
  group "root"
  mode 0755
  action :create
  recursive true
end


# create the certificate: make a request for signature for a certiciate, and have your own CA sign it.
bash "generate certificate" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  creates "#{node['selfsigned_certificate']['destination']}/server.key"
  code <<-EOH
        openssl genrsa -passout pass:#{node[:selfsigned_certificate][:sslpassphrase]} -des3 -out server.key 1024
  EOH
end

bash "generate signature request" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  creates "#{node['selfsigned_certificate']['destination']}/server.csr"
  code <<-EOH
        openssl req -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -subj "/C=#{node[:selfsigned_certificate][:country]}/ST=#{node[:selfsigned_certificate][:state]}/L=#{node[:selfsigned_certificate][:city]}/O=#{node[:selfsigned_certificate][:organisation]}/OU=#{node[:selfsigned_certificate][:depart]}/CN=#{node[:selfsigned_certificate][:cn]}/emailAddress=#{node[:selfsigned_certificate][:email]}" -new -key server.key -out server.csr
  EOH
end

bash "sign key" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  creates "#{node['selfsigned_certificate']['destination']}/server.key.org"
  code <<-EOH
        cp server.key server.key.org
        openssl rsa -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -in server.key.org -out server.key
  EOH
end

bash "signing the certificate" do
  user "root"
  cwd node['selfsigned_certificate']['destination']
  creates "#{node['selfsigned_certificate']['destination']}/server.crt"
  code <<-EOH
        openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
  EOH
end

# Fix perms
%w(server.crt  server.csr  server.key  server.key.org).each do |f|
  file "#{node['selfsigned_certificate']['destination']}/#{f}" do
    mode '0755'
  end
end