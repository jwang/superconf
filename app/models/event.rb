class Event < ActiveRecord::Base

  has_many :sponsors
  has_many :sponsorship_levels

  validates_presence_of :name


end
