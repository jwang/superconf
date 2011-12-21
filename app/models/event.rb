class Event < ActiveRecord::Base
  has_many :snippets
  validates_presence_of :name
end
