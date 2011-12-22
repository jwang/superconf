class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_event

  def find_event
    @event = Event.first
  end

end
