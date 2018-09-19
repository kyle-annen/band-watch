require "factory_bot"
require "faker"
require "pry"
require "rack/test"

require_relative "../app.rb"

F = FactoryBot

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.order = "random"

  config.expect_with :rspec do |expectations_config|
    expectations_config.syntax = %i[expect should]
  end

  config.mock_with :rspec do |mocks_config|
    mocks_config.syntax = :should
    mocks_config.verify_partial_doubles = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    def app
      App.new
    end
  end
end
