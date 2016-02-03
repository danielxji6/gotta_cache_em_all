FactoryGirl.define do
  factory :user do
    full_name { FFaker::Name.name }
    username{ FFaker::Internet.user_name + "testntest" }
    email { FFaker::Internet.free_email }
    password { '123' }
    admin { true }
  end
end
