$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sabre'
require 'webmock/rspec'
require 'timecop'
require 'shared_examples_for_base_api'

# Fake user_id and client_secret
Sabre.configure do |c|
  c.user_id = ''
  c.group = ''
  c.domain = 'EXT'
  c.client_secret = ''
  c.environment = 'https://api.test.sabre.com'
end
