FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end

  trait :with_projects do
    after(:create) do |p|
      create_list(:project, 5, user: user)
    end  
  end
end
