FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "item #{n}" }
    do_day          { Date.current + 2 }
    notice_day      { Date.current + 1 }

    inspection
  end
end
