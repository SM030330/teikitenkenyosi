require 'rails_helper'

RSpec.describe Inspection, type: :model do
  let(:category) { build(:category) }
  let!(:items) { build_list(:item, 5, inspection: inspection)}
  let(:inspection) { build(:inspection) }
  let(:inspection_without_items) { build(:inspection) }
  
  describe "Inspection model validations" do
    it "nameがなければ無効であること" do
      inspection.name = nil
      expect(inspection).not_to be_valid
    end
    
    it "itemが関連付けられてなければ無効であること" do
      expect(inspection_without_items.save).to eq true
      expect(inspection_without_items.items.size).to eq 0
    end
  
    it "categoryの関連付けが有効であること" do
      inspection.categories_to_inspections << build(:categories_to_inspection, category: category, inspection: inspection)

      expect(inspection.save).to  eq true
      expect(inspection.categories.size).to eq 1
    end

    it "doingはデフォルトでfalseであること" do
      expect(inspection.doing).to eq false
    end
  end
end
