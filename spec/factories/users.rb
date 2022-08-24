FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user #{n}" }
    sequence(:notice_email) { |n| "notice_email #{n}" }
    sequence(:email) { |n| "email #{n}" }
    encrypted_password { "132456asdf" }
  end
end
