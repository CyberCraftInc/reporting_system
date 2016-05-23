require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  # describe "anonymous user" do
  # 	before :each do
  # 		login_with nil
  # 	end
  # 	it "should be redirected to signin" do
  # 		get :index
  # 		expect( response ).to redirect_to ( new_user_session_path )
  # 	end
  # end

  describe "user logs in" do
  	it "should log in" do
  		login_as create( :user ), scope: :user
  		# password = '12345678'
  		# u = create( :user, password: password, password_confirmation: password )
  		# visit new_user_registration_path
  		# 	fill_in "Email", with: u.email
  		# 	fill_in "Password", with: password
  		# click_button "Log in"
  	end
  end

  describe "user logs out" do
  	it "should log out" do
  			logout ( :user )
  	end
  end

  describe "update profile" do
    it "should update profile" do
      login_as create( :user ), scope: :user
      
      visit edit_user_registration_path
        fill_in "Login", with: "New login"
        fill_in "Password", with: "987654321"
        fill_in "Password confirmation", with: "987654321"
        fill_in "Current password", with: :password
        
      # end
      click_link_or_button "Update"
      save_and_open_page
      #expect(page).to have_content('updated successfully')
    end
  end

  describe "delete profile" do
    it "should delete profile" do
      login_as create( :user ), scope: :user
      
      visit edit_user_registration_path
      click_link_or_button "Cancel my account"
    end
  end
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
