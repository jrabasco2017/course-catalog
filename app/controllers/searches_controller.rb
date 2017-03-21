class SearchesController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @searches= Search.search(params[:search], params[:subject])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def getAll
    @searches = Search.all
    return @searches
  end

  def updateEnroller
    @issue.remove_it(params[:my_param])
    @user = current_user
    @enroller = Enroll.create(course: @search.key)
    @enroller.save #store to database!
  end

  # GET /events/new
  def new
    @searches= Search.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create

    @search = Search.new(event_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @search.update(event_params)
        format.html { redirect_to @search, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @search}
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:search).permit(:key, :linked)
    end
end
