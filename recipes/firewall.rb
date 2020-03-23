# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Recipe:: firewall
#

firewall 'default'

# open multiple ports for http/https, note that the protocol
# attribute is required when using ports
firewall_rule 'http/https' do
  protocol :tcp
  port     [80, 443]
  command :allow
end
