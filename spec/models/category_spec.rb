require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { create(:user) }
  let(:category) { build(:category, user: user) }

  describe "category model validations" do
    it "nameがなければ無効であること" do
      category.name = nil
      expect(category).not_to be_valid
    end

    it "userが関連付けられてなければ無効であること" do
      category.user_id = nil
      expect(category).not_to be_valid
    end
  end
end
