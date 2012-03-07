class Admin::EventsController < Admin::AdminController
  before_filter :load_event, :only => [:show, :edit, :update, :destroy]
  before_filter :set_events_tab, :only => [:index, :new, :show, :edit]

  # GET /events
  # GET /events.json
  def index
    @active_tab="events"
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.json { head :ok }
    end
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end

  def set_events_tab
    @active_tab = "events"
    @active_sub_tab = "event" if @event
  end
end
