$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sacs_ruby'
require 'webmock/rspec'
require 'timecop'
require 'shared_examples_for_base_api'

# Fake user_id and client_secret
SacsRuby.configure do |c|
  c.user_id = 'fakeid111'
  c.group = 'DEVCENTER'
  c.domain = 'EXT'
  c.client_secret = 'fakepass111'
  c.environment = 'https://api.test.sabre.com'
end
