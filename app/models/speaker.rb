class Speaker < ActiveRecord::Base
  validates_presence_of :name, :event_id
  belongs_to :event
end
