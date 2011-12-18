require 'factory_girl'

Factory.define :proposal do |p|
  p.title "New Proposal"
  p.description "Awesome talk"
  p.association :user, :factory => :user
end
