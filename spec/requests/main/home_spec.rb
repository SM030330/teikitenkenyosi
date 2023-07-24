require 'rails_helper'

RSpec.describe "Main::Homes", type: :request do
  
  describe "GET /index" do
    context 'ログインしていないとき' do
      # before { get main_index_path }

      it "正常にレスポンスを返すこと" do
        visit main_index_path
        expect(page.status_code).to eq 200
      end
    end

    context 'ログインしてるとき' do
      let!(:user) { create(:user)}
      before do
        sign_in user
        visit main_index_path
      end
      it "正常にレスポンスを返すこと" do
        expect(page.status_code).to eq 200
        expect(page).to have_content user.name
      end
    end
  end
end
