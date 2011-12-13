class SponsorshipLevel < ActiveRecord::Base
  belongs_to :event
  validates :maximum, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :name, :maximum, :presence => true
end
