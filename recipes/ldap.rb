#
# Cookbook:: ritsema-banck
# Recipe:: ldap
#

include_recipe 'openldap::default'

template '/etc/ldap/ldap.conf' do
  source 'ldap.conf'
  mode '0755'
  owner node['openldap']['system_acct']
  group node['openldap']['system_group']
end

service 'slapd' do
  action :restart
end

execute 'slapadd' do
  #command 'slapadd -l /tmp/dump.ldif'
  command "ldapadd -D \"cn=admin,dc=ritsema-banck, dc=frl\" -w \"#{node['openldap']['rootpwplain']}\" -f /tmp/dump.ldif"
  creates '/var/lib/slapd/uid.bdb'
  sensitive true
  action :nothing
end

cookbook_file '/tmp/dump.ldif' do
  source 'dump.ldif'
  notifies :run, 'execute[slapadd]', :immediately
end