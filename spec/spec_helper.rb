# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'instance_store'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

if ENV['CI'] == 'true'
  require 'codecov'
  require 'instance_store'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
else
  require 'simplecov-console'
  SimpleCov.formatter = SimpleCov::Formatter::Console
end
SimpleCov.start
