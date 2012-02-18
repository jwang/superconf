class Admin::SponsorshipLevelsController < Admin::AdminController
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
    @sponsorship_level = @event.sponsorship_levels.find(params[:id])
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
    @sponsorship_level = @event.sponsorship_levels.find(params[:id])
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
    @sponsorship_level = @event.sponsorship_levels.find(params[:id])

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
    @sponsorship_level = @event.sponsorship_levels.find(params[:id])
    @sponsorship_level.destroy

    respond_to do |format|
      format.html { redirect_to admin_event_sponsorship_levels_url(@event) }
      format.json { head :ok }
    end
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

end
