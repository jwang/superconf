class Admin::SponsorshipLevelsController < Admin::AdminController
  before_filter :load_event
  before_filter :load_sponsorship_level, :only => [:show, :edit, :update, :destroy]
  before_filter :set_sponsorship_level_tab, :only => [:index, :new, :show, :edit]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsorship_levels = @event.sponsorship_levels

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsorship_levels }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    @sponsors = @event.sponsors.where(:sponsorship_level_id => @sponsorship_level)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsorship_level }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.json
  def new
    @sponsorship_level = @event.sponsorship_levels.new(:event => @event)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsorship_level }
    end
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsorship_level = @event.sponsorship_levels.new(params[:sponsorship_level])
    @sponsorship_level.event = @event
    respond_to do |format|
      if @sponsorship_level.save
        format.html { redirect_to [:admin, @event, @sponsorship_level], notice: 'Sponsorship Level was successfully created.' }
        format.json { render json: @sponsorship_level, status: :created, location: @sponsor }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsorship_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.json
  def update

    respond_to do |format|
      if @sponsorship_level.update_attributes(params[:sponsorship_level])
        format.html { redirect_to [:admin, @event, @sponsorship_level], notice: 'Sponsorship Level was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsorship_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsorship_level.destroy

    respond_to do |format|
      format.html { redirect_to admin_event_sponsorship_levels_url(@event) }
      format.json { head :ok }
    end
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_sponsorship_level
    @sponsorship_level = @event.sponsorship_levels.find(params[:id])
  end

  def set_sponsorship_level_tab
    @active_tab = "events"
    @active_sub_tab = "sponsorship_levels"
  end

end
