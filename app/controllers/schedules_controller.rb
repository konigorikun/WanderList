class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
  end

  def create
    Schedule.create(schedule_params)
    redirect_to schedules_path
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :region, :start_time, :end_time, :budget).merge(user_id: current_user.id)
  end
end

