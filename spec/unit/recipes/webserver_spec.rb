# frozen_string_literal: true

#
# Cookbook:: ritsema-banck
# Spec:: webserver
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ritsema-banck::webserver' do
  context 'When all attributes are default, on Ubuntu 19.10' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '19.10'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
