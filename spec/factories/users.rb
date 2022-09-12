FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user #{n}" }
    sequence(:notice_email) { |n| "#{n}notice@email.com" }
    sequence(:email) { |n| "#{n}email@email.com" }
    password { "132456asdf" }
    password_confirmation { "132456asdf" }
  end
end
