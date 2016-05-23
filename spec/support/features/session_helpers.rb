module Features
	module SessionHelpers
		def sign_up_with(login, email, password, conf_password)
			visit new_user_registration_path
			fill_in 'Login', with: login
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Password confirmation', with: conf_password
			click_button 'Sign up'
		end

		def sign_in(resource_or_scope, resource = nil)
			resource ||= resource_or_scope
			scope = Devise::Mapping.find_scope!(resource_or_scope)
			visit new_user_session_path
			fill_in 'Email', with: scope.email
			fill_in 'Password', with: scope.password
			click_button 'Log in'
		end
	end
end