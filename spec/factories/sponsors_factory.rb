require 'factory_girl'
require 'faker'

Factory.define :sponsor do |s|
  s.name Faker::Company.name
  s.description Faker::Lorem.paragraphs(3)
  s.association :event
  s.association :sponsorship_level
end
