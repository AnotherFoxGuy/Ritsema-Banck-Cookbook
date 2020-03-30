# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: security
#

firewall 'default'

# open standard ssh port
firewall_rule 'ssh' do
  port     22
  command  :allow
end

# open multiple ports for http/https, note that the protocol
# attribute is required when using ports
firewall_rule 'http/https' do
  protocol :tcp
  port     [80, 443]
  command :allow
end

cookbook_file '/etc/ssh/sshd_config' do
  source 'sshd_config'
end

cookbook_file '/etc/apache2/apache2.conf' do
  source 'apache2.conf'
end

include_recipe 'fail2ban::default'