class Admin::SponsorsController < Admin::AdminController
  before_filter :load_event
  before_filter :load_sponsor, :only => [:show, :edit, :update, :destroy]
  before_filter :set_sponsors_tab, :only => [:index, :new, :show, :edit]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = @event.sponsors

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsors }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.json
  def new
    @sponsor = @event.sponsors.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = @event.sponsors.new(params[:sponsor])

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to [:admin, @event, @sponsor], notice: 'Sponsor was successfully created.' }
        format.json { render json: @sponsor, status: :created, location: @sponsor }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.json
  def update

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        format.html { redirect_to [:admin, @event, @sponsor], notice: 'Sponsor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to admin_event_sponsors_url(@event) }
      format.json { head :ok }
    end
  end


  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_sponsor
    @sponsor = @event.sponsors.find(params[:id])
  end

  def set_sponsors_tab
    @active_tab = "events"
    @active_sub_tab = "sponsors"
  end
end
