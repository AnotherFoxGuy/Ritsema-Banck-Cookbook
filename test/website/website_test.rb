# InSpec test for recipe ritsema-banck::website

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe http('http://localhost') do
  its('status') { should cmp 200 }
end

describe http('http://localhost/../lib/hacked.txt') do
  its('status') { should cmp 404 }
end
