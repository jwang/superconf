class Event < ActiveRecord::Base
  has_many :snippets
  has_many :sponsors
  has_many :sponsorship_levels
  has_many :speakers
  validates_presence_of :name, :year
  #validates_uniqueness_of :year
end
