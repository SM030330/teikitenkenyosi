require 'rails_helper'

RSpec.describe "Main::Inspections", type: :request do
  let!(:user) { create(:user) }
  let(:inspection) { create(:inspection, user: user) }
  let(:item) { create(:item, user: user, inspection: inspection) }

  before { sign_in user }

  describe "GET /index" do
    before { get main_inspections_path }

    it "正常にレスポンスを返すこと" do
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    before do
      inspection
      get main_inspection_path(inspection.id)
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    before do
      inspection
      get edit_main_inspection_path(inspection.id)
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to be_successful
    end
  end
end
