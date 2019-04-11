# # encoding: utf-8

# Inspec test for recipe apache::server

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(80) do
  it { should be_listening }
end

describe file('/var/www/html/index.html') do
  it { should exist }
  its(:content) { should match 'Hello, world'}
end

describe upstart_service('apache2') do
  it { should be_running }
  it { should be_enabled }
end