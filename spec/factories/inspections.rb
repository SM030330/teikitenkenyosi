FactoryBot.define do
  factory :inspection do
    sequence(:name) { |n| "inspection #{n}" }
    comment         { "aaaa bbbbbb あああああ　123456" }
  end
end
