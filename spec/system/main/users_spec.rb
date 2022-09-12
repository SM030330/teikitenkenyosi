require 'rails_helper'

RSpec.describe "Main::Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "GET /main/user/sign_up" do
    scenario "sign_up処理が正しく行えること" do
      visit new_main_user_registration_path

      fill_in 'Email',                 with: 'a@example.com'
      fill_in 'Password',              with: '123456'
      fill_in 'Password confirmation', with: '123456'
      
      expect{ click_button 'Sign up' }.to change(User, :count).by(1)
      expect(current_path).to eq root_path
    end
  end

  describe "GET /main/user/sign_in" do
    let!(:user) { create(:user) }

    scenario "sign_in処理が正しく行えること" do
      visit new_main_user_session_path
  
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
  
      expect(current_path).to eq root_path
    end
  end
end