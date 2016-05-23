ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require_relative 'support/controller_helpers'
  require 'devise'
  require 'rspec/rails'
  require 'rspec/autorun'
  require "capybara/rspec"
  require "capybara/rails"
  require "capybara/dsl"
  require 'database_cleaner'


RSpec.configure do |config|

  config.include Rails.application.routes.url_helpers

  config.fail_fast = true
  config.use_instantiated_fixtures = false
  config.include(Capybara, :type => :integration)

  config.after do |example|
    if example.metadata[:type] == :feature and example.exception.present?
      save_and_open_page
    end
  end

  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  #config.raise_errors_for_deprecations!
  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

end


