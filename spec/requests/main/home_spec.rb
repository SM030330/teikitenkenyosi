require 'rails_helper'

RSpec.describe "Main::Homes", type: :request do
  describe "GET /index" do
    before { get main_index_path }

    it "正常にレスポンスを返すこと" do
      expect(response).to be_successful
    end
  end
end
