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
      
      click_button '+'
      fill_in 'inspection[name]'                            ,with: 'name1'
      fill_in 'inspection[comment]'                         ,with: 'コメント'
      fill_in 'inspection[items_attributes][0][name]'       ,with: 'item_name1'
      fill_in 'inspection[items_attributes][0][do_day]'     ,with: Date.current + 2 
      fill_in 'inspection[items_attributes][0][notice_day]' ,with: Date.current + 1

      expect{ click_button 'commit' }.to change(Inspection, :count).by(1)
    end
  end  
end
