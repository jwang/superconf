class Sponsor < ActiveRecord::Base
  belongs_to :event
  belongs_to :sponsorship_level
end
