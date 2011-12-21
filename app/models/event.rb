class Event < ActiveRecord::Base

  has_many :sponsors
  has_many :sponsorship_levels

  has_many :snippets
  validates_presence_of :name
end
