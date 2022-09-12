require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:items) { build_list(:item, 5, inspection: inspection)}
  let(:inspection) { create(:inspection, user: user) }
  let(:user) { create(:user) }
  let(:inspection_without_items) { build(:inspection) }

  describe "model validations" do
    it "nameがなければ無効であること" do
      items[0].name = nil
      expect(items[0]).not_to be_valid
    end

    describe "do_day column" do
      it "do_dayがなければ無効であること" do
        items[0].do_day = nil
        expect(items[0]).not_to be_valid
      end

      context "do_dayが登録日より前のとき" do
        it "do_dayは無効であること" do
          items[0].do_day = Date.current - 1
          expect(items[0]).not_to be_valid
        end
      end

      context "do_dayが登録日より後のとき" do
        it "do_dayは有効であること" do
          items[0].do_day = Date.current + 2
          expect(items[0]).to be_valid
        end
      end
    end

    describe "notice_day column" do
      it "notice_dayがなければ無効であること" do
        items[0].notice_day = nil
        expect(items[0]).not_to be_valid
      end

      context "notice_dayがdo_dayより前のとき" do
        it "notice_dayは有効であること" do
          items[0].notice_day = items[0].do_day - 1
          expect(items[0]).to be_valid
        end
      end

      context "notice_dayがdo_dayより後のとき" do
        it "notice_dayは無効であること" do
          items[0].notice_day = items[0].do_day + 1
          expect(items[0]).not_to be_valid
        end
      end
    end

    it "doingはデフォルトでfalseであること" do
      expect(inspection.doing).to eq false
    end

    it "inspectionとの関連付けがなければ無効であること" do
      items[0].inspection_id = nil
      expect(items[0].save).to eq false
    end
  end
end
