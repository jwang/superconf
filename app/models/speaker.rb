class Speaker < ActiveRecord::Base
  validates_presence_of :name, :event_id
  belongs_to :event
  has_attached_file :image, :styles => { :default => "150x150", :thumb => "50x50" }
end
