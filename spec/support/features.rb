RSpec.configure do |config|
	config.include Features::SessionHelpers, type: :feature
	#config.include DeviseRequestSpecHelpers, type: :request
end
