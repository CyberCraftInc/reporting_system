# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'shoulda/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  #config.filter_run focus: true
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryGirl::Syntax::Methods
  #config.include LoginMacros
  config.include Devise::TestHelpers, type: :controller  
  #config.include Devise::Test::ControllerHelpers, type: :view
  config.include Warden::Test::Helpers

  config.use_transactional_fixtures = true
  
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  #config.filter_rails_from_backtrace!
  # arbitrary #gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
end

