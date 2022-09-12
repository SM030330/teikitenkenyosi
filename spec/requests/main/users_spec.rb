require 'rails_helper'

RSpec.describe "Main::Users", type: :request do
  describe "GET /mian/user/sign_up" do
    before { get new_main_user_registration_path }

    it "正常にレスポンスを返すこと" do
      expect(response).to be_successful
    end
  end
end
