FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "item #{n}" }
    do_day          { Date.today + 50 }
    notice_day      { Date.today + 40 }

    inspection
  end
end
