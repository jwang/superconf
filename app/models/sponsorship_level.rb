class SponsorshipLevel < ActiveRecord::Base
  belongs_to :event
  has_many :sponsors
  validates :maximum, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :name, :maximum, :presence => true

  default_scope :order => 'maximum ASC'
end
