# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
  end
end
