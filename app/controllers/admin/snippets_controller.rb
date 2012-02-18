class Admin::SnippetsController < Admin::AdminController
  before_filter :find_event

  # GET /snippets
  # GET /snippets.json
  def index
    @snippets = @event.snippets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    @snippet = @event.snippets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet }
    end
  end

  # GET /snippets/new
  # GET /snippets/new.json
  def new
    @snippet = @event.snippets.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = @event.snippets.find(params[:id])
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = @event.snippets.new(params[:snippet])

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to admin_event_snippet_path(@event, @snippet), notice: 'Snippet was successfully created.' }
        format.json { render json: @snippet, status: :created, location: @snippet }
      else
        format.html { render action: "new" }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.json
  def update
    @snippet = @event.snippets.find(params[:id])

    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        format.html { redirect_to admin_event_snippet_path(@event, @snippet), notice: 'Snippet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to admin_event_snippets_url(@event) }
      format.json { head :ok }
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

end
