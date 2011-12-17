require 'factory_girl'
require 'faker'
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end

  factory :proposal do
    title "New Proposal"
    description "Awesome talk"
    association :user, :factory => :user
  end
end