require 'rails_helper'

RSpec.describe Inspection, type: :model do
  let!(:user) { create(:user) }
  let(:category) { build(:category, user: user) }
  let!(:items) { build_list(:item, 5, inspection: inspection)}
  let(:inspection) { build(:inspection, user: user) }
  let(:inspection_without_items) { build(:inspection) }
  
  describe "Inspection model validations" do
    it "nameがなければ無効であること" do
      inspection.name = nil
      expect(inspection).not_to be_valid
    end
    
    it "itemが関連付けられてなければ無効であること" do
      expect(inspection_without_items).not_to be_valid
    end
  
    it "categoryの関連付けが有効であること" do
      inspection.categories_to_inspections << build(:categories_to_inspection, category: category, inspection: inspection)

      expect(inspection.save).to  eq true
      expect(inspection.categories.size).to eq 1
    end

    it "doingはデフォルトでfalseであること" do
      expect(inspection.doing).to eq false
    end

    it "userが関連付けられてなければ無効であること" do
      inspection.user_id = nil
      expect(inspection).not_to be_valid
    end
  end
end
