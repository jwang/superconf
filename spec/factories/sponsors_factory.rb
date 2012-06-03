require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :sponsor do
    name Faker::Company.name
    description Faker::Lorem.paragraphs(3)
    association :event
    association :sponsorship_level
  end
end
