require 'rails_helper'

RSpec.describe "Main::Inspections", type: :system do
  before do
    driven_by(:rack_test)
  end
  let(:user) { create(:user) }
  before do
    sign_in user 
  end

  describe "GET main/index" do  
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
  
  describe "GET main/inspections/index" do
    let(:inspection) { create(:inspection, user: user) }
    let!(:item) { create(:item, user: user, inspection: inspection) }

    scenario "Itemsの作業条件の切り替えができること" do
      visit main_inspections_path
      check 'form_item_collection[items_attributes][0][doing]'
      click_button '作業状態を変更する'
      expect(find('.form-check')).to have_content 'true'
    end
  end
end
