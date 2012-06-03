require 'factory_girl'

FactoryGirl.define do
  factory :proposal do
    title "New Proposal"
    description "Awesome talk"
    association :user, :factory => :user
    location "Springfield"
    bio "Awesome Coder"
    speaker_cv "Every conference worth talking at"
  end
end
