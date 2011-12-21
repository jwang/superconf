require 'factory_girl'
require 'faker'

Factory.define :snippet do |f|

  f.name Faker::Company.name

end