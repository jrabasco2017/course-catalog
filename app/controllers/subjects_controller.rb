require 'json'

class SubjectsController < ApplicationController
  before_action :set_subject, only:[:show, :edit, :create]


def index
  file = File.read('subject.json')
  @subjects= Subject.all
end

def show
end

def new
  @subject  = Subject.new

end

def create
  @subject  = Subject.new(subject_params)
  respond_to do |format|
    if @subject .save
      format.html { redirect_to @subject , notice: 'Event was successfully created.' }
      format.json { render :show, status: :created, location: @subject }
    else
      format.html { render :new }
      format.json { render json: @subject.errors, status: :unprocessable_entity }
    end
  end
end

private
  def set_subject
    @subjects  = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end

end
