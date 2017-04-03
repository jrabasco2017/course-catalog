class EnrollsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
    # GET /events
    # GET /events.json
    def index
      @enrolls = Enroll.all
    end

    # GET /events/1
    # GET /events/1.json
    def show
    end

    def updater

    end

    def adder
      @reddit = Array.new
      Enroll.all.each do |inner|
        @reddit.append(inner)
      end
      tester = params[:my_param]
      counter =0
      @reddit.each do |check|
        if tester.to_s == check.to_s
          counter =1
        end
      end

      if counter != 1
        @rollup = Enroll.create(course: params[:my_param])
        @rollup.save
        @reddit.append(tester)
      end
      @enrolls = Enroll.all
    end

    # GET /events/new
    def new
      @enroll = Enroll.new
    end

    # GET /events/1/edit
    def edit
    end

    # POST /events
    # POST /events.json
    def create
      @enroll = Enroll.new(event_params)

      respond_to do |format|
        if @enroll.save
          format.html { redirect_to @enroll, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @enroll }
        else
          format.html { render :new }
          format.json { render json: @enroll.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /events/1
    # PATCH/PUT /events/1.json
    def update
      respond_to do |format|
        if @enroll.update(event_params)
          format.html { redirect_to @enroll, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @enroll}
        else
          format.html { render :edit }
          format.json { render json: @enroll.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /events/1
    # DELETE /events/1.json
    def destroy
      @enroll.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @enroll = Enroll.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def event_params
        params.require(:enroll).permit(:course)
      end
  end
