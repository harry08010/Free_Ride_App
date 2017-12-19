require 'rails_helper'

RSpec.feature "LoginLogouts", type: :feature do
  scenario "user signup" do
      user = FactoryGirl.build(:user)
      
      visit signup_path
      expect(page).to have_content "Sign up"
      
      fill_in "First Name", with: user.first_name
      fill_in "Last Name", with: user.last_name
      #choose "male"
      #choose "Driver"
      #fill_in "NickName", with: user.nickname
      #fill_in "Password", with: user.password
      #fill_in "Password Confirm", with: user.password
      #fill_in "E-mail", with: user.email
      #fill_in "Phone", with: user.phone
  end
  
  scenario "user login" do
      user = FactoryGirl.build(:user)
      
      visit login_path
      expect(page).to have_content "Sign in"
      
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      
      click_button "Sign in"
      #expect(page).to have_content user.nickname
  end
end
