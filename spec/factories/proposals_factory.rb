require 'factory_girl'

Factory.define :proposal do |p|
  p.title "New Proposal"
  p.description "Awesome talk"
  p.association :user, :factory => :user
  p.location "Springfield"
  p.bio "Awesome Coder"
  p.speaker_cv "Every conference worth talking at"
end
