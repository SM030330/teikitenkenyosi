require 'rails_helper'

RSpec.describe "Main::Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  let(:user) { create(:user) }

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

  describe "GET /main/user/sign_in, sign_out" do
    before { user }

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

  describe "GET /main/user/edit" do
    before { sign_in user }

    scenario "user情報の編集が正しく行えること" do
      visit edit_main_user_registration_path
      fill_in 'main_user[name]', with: 'edited_user_name'
      fill_in 'main_user[email]', with: 'edited@example.com' 
      fill_in 'main_user[notice_email]', with: 'edited_notice@example.com' 
      fill_in 'main_user[current_password]', with: "132456asdf"
      click_button 'PassWordの変更'
      fill_in 'main_user[password]', with: 'edited_password'
      fill_in 'main_user[password_confirmation]', with: 'edited_password'

      click_button '変更を完了する'
      expect(current_path).to eq root_path
      expect(User.find_by(id: user.id).name).to eq 'edited_user_name'
      expect(User.find_by(id: user.id).email).to eq 'edited@example.com'
      expect(User.find_by(id: user.id).notice_email).to eq 'edited_notice@example.com'
      # passwordの確認
      sign_out user
      visit new_main_user_session_path
      fill_in 'main_user[email]',    with: 'edited@example.com'
      fill_in 'main_user[password]', with: 'edited_password'
      click_button 'ログイン'
      expect(current_path).to eq root_path
      expect(page).to have_content "直近の予定"
    end
  end

  describe "GET /main/guest_sign_in, /main/users/sign_out" do

    scenario "guest_sign_in, sign_out処理が正しく行えること" do
      visit root_path
  
      click_button 'ゲストログイン(閲覧用)'
      expect(current_path).to eq root_path
      expect(page).to have_content '直近の予定'
    
      within(:css, '.display-noncolapse') do
        click_button 'Sign out'
      end
      expect(current_path).to eq root_path
      expect(page).to have_content 'あなたの予定整理をサポートします'
    end
  end

  describe "GET /main/user/edit" do
    before do
      visit root_path
      click_button 'ゲストログイン(閲覧用)'
    end

    scenario "guest_userはuser情報の編集が行えないこと" do
      visit edit_main_user_registration_path
      fill_in 'main_user[name]', with: 'edited_user_name'
      fill_in 'main_user[email]', with: 'edited@example.com' 
      fill_in 'main_user[current_password]', with: "132456asdf"
      click_button '変更を完了する'
      expect(current_path).to eq root_path
      expect(User.last).to eq User.find_by(email: 'guest@example.com')

      visit main_users_user_path(id: User.find_by(email: 'guest@example.com').id)
      click_link "アカウントを削除する"
      expect(current_path).to eq root_path
      expect(User.last).to eq User.find_by(email: 'guest@example.com')
    end
  end
end
