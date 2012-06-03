require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    email       { Faker::Internet.email } #'john.doe@gmail.com'
    password    '123456'
    # this is freaking out not confirmable
    #consent     'false'
    #first_name  Faker::Name.first_name
    #last_name   Faker::Name.last_name
    password_confirmation {|u| u.password}
  end

  factory :admin, :class => User do
    email       { Faker::Internet.email } #'john.doe@gmail.com'
    password    '123456'
    # this is freaking out not confirmable
    #consent     'false'
    #first_name  Faker::Name.first_name
    #last_name   Faker::Name.last_name
    password_confirmation {|u| u.password}
    role "admin"
  end
end
