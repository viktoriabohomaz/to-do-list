# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { Faker::FunnyName.name }
    uid { Faker::Name.first_name }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end

  trait :with_projects do
    after(:create) do |_p|
      create_list(:project, 5, user: user)
    end
  end
end
