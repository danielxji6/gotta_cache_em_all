FactoryGirl.define do
  factory :admin, class: User do
    full_name { FFaker::Name.name }
    username{ FFaker::Internet.user_name + "testntest" }
    email { FFaker::Internet.free_email }
    password { '123' }
    admin { true }
  end

  factory :user, class: User do
    full_name { FFaker::Name.name }
    username{ FFaker::Internet.user_name + "testntest" }
    email { FFaker::Internet.free_email }
    password { '123' }
    admin { false }
  end
end
