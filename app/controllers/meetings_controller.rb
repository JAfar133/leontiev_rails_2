class MeetingsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :show, :index]
  
    def index
      @meetings = Meeting.all
    end
  
    def edit
      @meeting = Meeting.find(params[:id])
    end
  
    def new
        @meeting = Meeting.new
    end
  
    def create
        @meeting = Meeting.new(meeting_params)
        @meeting.created_by = current_user
      
        if @meeting.save
          redirect_to meetings_path(@meeting), notice: 'Meeting was successfully created.'
        else
          render :new
        end
    end  
  
    def update
      @meeting = Meeting.find(params[:id])
      if @meeting.update(meeting_params)
        redirect_to meetings_path(@meeting), notice: 'Meeting was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @meeting = Meeting.find(params[:id])
      @meeting.destroy
      redirect_to meetings_path, notice: 'Meeting was successfully destroyed.'
    end
  
    private
  
    def meeting_params
      params.require(:meeting).permit(:location, :title, :date, :description)
    end
  end
  