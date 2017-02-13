FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Hipster.word }
  end
end
