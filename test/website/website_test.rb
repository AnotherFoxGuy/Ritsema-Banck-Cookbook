# InSpec test for recipe ritsema-banck::website

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


describe file('/var/www/src/index.php') do
  its('mode') { should cmp '0644' }
end

describe file('/var/www/intranet/index.php') do
  its('mode') { should cmp '0644' }
end

describe file('/var/www/vendor/autoload.php') do
  it { should exist }
end