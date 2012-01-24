require 'rubygems'
require 'simplecov'

SimpleCov.start

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'fraudpointer-client'

require 'mocha'

# XXX : This is a hack and it's needed because webmock/rspec and teamcity conflict!
# See https://github.com/bblimke/webmock/commit/9d255f118a6a39d297856fa83302aca1577b2c03#commitcomment-789795
# and https://github.com/bblimke/webmock/issues/64#issuecomment-3121086.
require 'rspec/expectations'
require 'webmock/rspec'
require 'vcr'

# VCR Setup
VCR.config do |c|
  c.cassette_library_dir = File.expand_path('../../fixtures/vcr_cassettes', __FILE__)
  c.stub_with :webmock
  c.allow_http_connections_when_no_cassette = false
end

RSpec.configure do |config|
  config.mock_framework = :mocha
end
