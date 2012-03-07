require 'factory_girl'
require 'faker'

Factory.define :event do |f|
  f.name Faker::Company.name
  f.year (1000..3000).to_a.sample.to_s
end
