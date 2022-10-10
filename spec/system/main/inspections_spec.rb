require 'rails_helper'

RSpec.describe "Main::Inspections", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "GET main/index" do
    let(:user) { create(:user) }
    before do
      sign_in user 
    end

    scenario "新規Inspection, Itemsの登録ができること" do
      visit root_path
      
      fill_in 'name' 
      expect(page).to have_content 'Log out' 
    end
  end
end
