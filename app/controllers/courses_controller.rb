require 'json'

class CoursesController < ApplicationController
  before_action :set_course, only:[:show, :edit, :create]

  def index
      @courses= Course.all
  end

  def show
  end

  def searchIndex
    @courses= Course.search(params[:search], params[:search_column])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end
  
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @course}
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_course
      @courses = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :idep, :subjects)
    end
end
