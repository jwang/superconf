require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :event do
    name Faker::Company.name
    year (1000..3000).to_a.sample.to_s
  end
end
