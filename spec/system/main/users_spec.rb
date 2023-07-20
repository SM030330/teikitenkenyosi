require 'rails_helper'

RSpec.describe "Main::Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "GET /main/user/sign_up" do
    scenario "sign_up処理が正しく行えること" do
      visit new_main_user_registration_path
      
      fill_in 'main_user[email]',                 with: 'a@example.com'
      fill_in 'main_user[password]',              with: '123456'
      fill_in 'main_user[password_confirmation]', with: '123456'
      
      expect{ click_button '新規登録' }.to change(User, :count).by(1)
      expect(current_path).to eq root_path
    end
  end

  describe "GET /main/user/sign_in" do
    let!(:user) { create(:user) }

    scenario "sign_in, sign_out処理が正しく行えること" do
      visit new_main_user_session_path
  
      fill_in 'main_user[email]',    with: user.email
      fill_in 'main_user[password]', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq root_path
      expect(page).to have_content '直近の予定'
    
      within(:css, '.display-noncolapse') do
        click_button 'Sign out'
      end
      expect(current_path).to eq root_path
      expect(page).to have_content 'あなたの予定整理をサポートします'
    end
  end
end