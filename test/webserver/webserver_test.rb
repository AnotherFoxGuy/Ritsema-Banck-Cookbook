# frozen_string_literal: true

# InSpec test for recipe ritsema-banck::webserver

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# describe apache_conf do
#   its ('LogLevel') { should cmp 'warn' }
# end

describe http('http://localhost') do
  its('status') { should cmp 200 }
end

describe http('http://localhost/../lib/hacked.txt') do
  its('status') { should cmp 404 }
end

describe http('http://localhost/test-ldap.php') do
  its('status') { should cmp 200 }
  its('body') { should cmp 'success' }
end

describe http('http://localhost/test-mariadb.php') do
  its('status') { should cmp 200 }
  its('body') { should cmp 'success' }
end
