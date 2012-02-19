class EventsController < ApplicationController
  before_filter :load_by_year, :except => [:index, :show, :current]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def current
    @active_tab = "home"
    @event = Event.last
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def call_for_sponsors
    @active_tab = "sponsors"
  end

  def sponsors
    @active_tab = "sponsors"
  end

  def call_for_proposals
    @active_tab = "program"
  end

  def location
    @active_tab = "location"
  end

  def program
    @active_tab = "program"
  end

  def training
    @active_tab = "training"
  end

  private 

  def load_by_year
    @event = Event.find_by_year(params[:id])
    @event = Event.find(params[:id]) if @event.nil?
  end
end
