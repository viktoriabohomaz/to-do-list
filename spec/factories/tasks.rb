# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Lorem.sentence }
    deadline { Faker::Date.between(10.days.ago, Date.today) }
    project
  end

  trait :with_comments do
    after(:create) do |_t|
      create_list(:comment, 2, task: task)
    end
  end
end
