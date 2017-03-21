require 'json'

class InstructorsController < ApplicationController
    before_action :set_instructor, only:[:show, :edit, :create]


  def index
    @instructors= Instructor.all
  end

  def show
  end

  def new
    @instructor  = Instructor.new
  end

  def create
    @instructor  = Instructor.new(instructor_params)
    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor , notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_instructor
      @instructors  = Instructor.find(params[:id])
    end

    def instructor_params
      params.require(:instructor).permit(:first, :last, :ident)
    end

end
