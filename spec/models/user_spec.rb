require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "User model validations" do
    it "nameがなければゲストユーザーが登録されること" do
      user.name = nil
      expect(user.save).not_to be_valid
    end

    it "emailがなければ無効であること" do
      user.email = nil
      expect(user.email).not_to be_valid
    end

    it "notice_emailがなければemailが登録されること" do
      user.notice_email = nil
      user.save
      expect(user.notice_email).to be user.email
    end
  end
end
