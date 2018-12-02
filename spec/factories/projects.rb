# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    description { Faker::Lorem.sentence }
    user
  end

  trait :with_tasks do
    after(:create) do |t|
      create_list(:task, 5, project: project)
    end
  end
end
