require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :sponsorship_level do
    association :event
    name Faker::Company.name
    description Faker::Lorem.paragraphs(3)
    maximum (10000..100000).to_a.sample
  end
end
