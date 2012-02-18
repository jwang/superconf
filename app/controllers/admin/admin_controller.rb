class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :enforce_admin
  before_filter :find_event
  
  def dashboard
    redirect_to admin_events_path
  end

  private

  def enforce_admin
    redirect_to root_path unless current_user.admin?
  end
end
