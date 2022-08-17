require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  describe "category model validations" do
    it "nameがなければ無効であること" do
      category.name = nil
      expect(category).not_to be_valid
    end
  end
end
