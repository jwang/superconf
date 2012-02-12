class Sponsor < ActiveRecord::Base
  belongs_to :event
  belongs_to :sponsorship_level

  has_attached_file :logo,
                    :styles => { :medium => "160x60>", :thumb => "180x80>" }

  validates :name, :event_id, :presence => true
end
