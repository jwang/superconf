class Speaker < ActiveRecord::Base
  validates_presence_of :name, :event_id
  belongs_to :event
  
  # image/picture of a speaker
  has_attached_file :image, :styles => { :default       => "150x150",
                                         :default_crop  => "150x150#", 
                                         :thumb         => "50x50", 
                                         :thumb_crop    => "50x50#"
                                       }
end
