#
# Cookbook:: ritsema-banck
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

include_recipe 'ritsema-banck::webserver'
include_recipe 'ritsema-banck::database'
#include_recipe 'ritsema-banck::website'