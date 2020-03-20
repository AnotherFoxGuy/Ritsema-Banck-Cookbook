# InSpec test for recipe ritsema-banck::database

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe mysql_session('ritsema_banck', 'kaas').query('SELECT * FROM QA'), :skip do
  its('stdout') { should match(/expected-result/) }
end
