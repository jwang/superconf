require 'factory_girl'
require 'faker'

Factory.define :sponsorship_level do |s|
  s.association :event
  s.name Faker::Company.name
  s.description Faker::Lorem.paragraphs(3)
  s.maximum (10000..100000).to_a.sample
end
