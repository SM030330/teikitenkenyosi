class Item < ApplicationRecord
  belongs_to :inspection, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :do_day, presence: true
  validates :notice_day, presence: true
  validate :do_day_is_today_or_before_today, on: :create 
  validate :notice_day_is_after_do_day
 
  def do_day_is_today_or_before_today
    if do_day.present?  && do_day <= Date.current 
      errors.add(:do_day, "は登録日より前には設定できません")
    end
  end

  def notice_day_is_after_do_day
    if do_day.present? && notice_day.present? && notice_day >= do_day
      errors.add(:notice_day, "は実施日より後には設定できません")
    end
  end
end
