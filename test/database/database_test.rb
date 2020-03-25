# frozen_string_literal: true

# InSpec test for recipe ritsema-banck::database

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe mysql_session('root', '5aKWmd5UQDfxbDXmJEmPQueu').query('SELECT * FROM QA'), :skip do
  its('stdout') { should match(/expected-result/) }
end
