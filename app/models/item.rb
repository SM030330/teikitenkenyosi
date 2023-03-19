class Item < ApplicationRecord
  belongs_to :inspection, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :do_day, presence: true
  validates :notice_day, presence: true
  validate :do_day_is_today_or_before_today,
           :notice_day_is_after_do_day
 
  def do_day_is_today_or_before_today
    if do_day.present? && do_day <= Date.current
      errors.add(:do_day, "登録日より前には設定できません")
    end
  end

  def notice_day_is_after_do_day
    if do_day.present? && notice_day.present? && notice_day >= do_day
      errors.add(:notice_day, "作業日より後には設定できません")
    end
  end
end
