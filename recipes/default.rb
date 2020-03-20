#
# Cookbook:: ritsema-banck
# Recipe:: default
#

include_recipe 'ritsema-banck::selfsignedcert'
include_recipe 'ritsema-banck::database'
include_recipe 'ritsema-banck::ldap'
include_recipe 'ritsema-banck::webserver'
include_recipe 'ritsema-banck::website'