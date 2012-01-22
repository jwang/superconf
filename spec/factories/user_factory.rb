require 'factory_girl'
require 'faker'

Factory.define :user do |f|
  
  #f.sequence(:email) {|n| "user-#{n}@example.com" }
  f.email       { Faker::Internet.email } #'john.doe@gmail.com'
  f.password    '123456'
  # this is freaking out not confirmable
  #f.consent     'false'
  #f.first_name  Faker::Name.first_name
  #f.last_name   Faker::Name.last_name
  f.password_confirmation {|u| u.password}
end

Factory.define :admin, :class => User do |f|
  
  #f.sequence(:email) {|n| "user-#{n}@example.com" }
  f.email       { Faker::Internet.email } #'john.doe@gmail.com'
  f.password    '123456'
  # this is freaking out not confirmable
  #f.consent     'false'
  #f.first_name  Faker::Name.first_name
  #f.last_name   Faker::Name.last_name
  f.password_confirmation {|u| u.password}
  f.role "admin"
end
