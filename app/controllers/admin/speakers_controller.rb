class Admin::SpeakersController < Admin::AdminController
  before_filter :load_event
  before_filter :load_speaker, :only => [:show, :edit, :update, :destroy]
  before_filter :set_speakers_tab, :only => [:index, :new, :show, :edit]

  # GET /speakers
  # GET /speakers.json
  def index
    @speakers = @event.speakers

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @speakers }
    end
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @speaker }
    end
  end

  # GET /speakers/new
  # GET /speakers/new.json
  def new
    @speaker = @event.speakers.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @speaker }
    end
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  # POST /speakers.json
  def create
    @speaker = @event.speakers.new(params[:speaker])

    respond_to do |format|
      if @speaker.save
        format.html { redirect_to [:admin, @event, @speaker], notice: 'Speaker was successfully created.' }
        format.json { render json: @speaker, status: :created, location: @speaker}
      else
        format.html { render action: "new" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /speakers/1
  # PUT /speakers/1.json
  def update

    respond_to do |format|
      if @speaker.update_attributes(params[:speaker])
        format.html { redirect_to [:admin, @event, @speaker], notice: 'Speaker was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy

    respond_to do |format|
      format.html { redirect_to admin_event_speakers_url(@event) }
      format.json { head :ok }
    end
  end


  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_speaker
    @speaker = @event.speakers.find(params[:id])
  end

  def set_speakers_tab
    @active_tab = "events"
    @active_sub_tab = "speakers"
  end
end
