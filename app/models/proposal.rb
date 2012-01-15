class Proposal < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :description, :location, :bio, :speaker_cv
end
