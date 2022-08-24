require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "User model validations" do
    it "nameがなければゲストユーザーが登録されること" do
    end

    it "emailがなければ無効であること" do
    end

    it "notice_emailがなければemailが登録されること" do
    end
  end
end
