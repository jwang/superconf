require 'factory_girl'
require 'faker'

Factory.define :event do |f|
  
  f.name Faker::Company.name
  
end