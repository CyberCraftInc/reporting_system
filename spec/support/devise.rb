require "devise"
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  #config.include Devise::Test::ControllerHelpers, type: :view
end
