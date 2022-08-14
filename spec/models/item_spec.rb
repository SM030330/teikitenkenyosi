require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:category) { build(:category) }
  let(:item) { build(:item)}
  let(:inspection) { build(:inspection, items: [item]) }
  let(:inspection_without_items) { build(:inspection) }

  describe "Item model validations"
    before do
      inspection.item
    end

    it "nameがなければ無効であること" do
      item.name = nil
      expect(item).not_to be_valid
    end

    describe "do_day column" do
      it "do_dayがなければ無効であること" do
        item.do_day = nil
        expect(item).not_to be_valid
      end

      context "do_dayが登録日より前のとき" do
        it "do_dayは無効であること" do
          item.do_day = Date.today - 1
          expect(item).not_to be_valid
        end
      end

      context "do_dayが登録日より後のとき" do
        it "do_dayは有効であること" do
          item.do_day = Date.today + 1
          expect(item).to be_valid
        end
      end
    end

    describe "notice_day column" do
      it "notice_dayがなければ無効であること" do
        item.do_day = nil
        expect(item).not_to be_valid
      end

      context "notice_dayがdo_dayより前のとき" do
        it "notice_dayは無効であること" do
          item.notice_day = item.do_day - 1
          expect(item).not_to be_valid
        end
      end

      context "notice_dayがdo_dayより後のとき" do
        it "notice_dayは有効であること" do
          item.notice_day = item.do_day + 1
          expect(item).to be_valid
        end
      end
    end

    it "doingはデフォルトでfalseであること" do
      
    end
  end

  describe "itemの関連付けについて" do
    it "inspectionとの関連付けがなければ無効であること" do
      expect(item).not_to be_valid
    end
  end
end
