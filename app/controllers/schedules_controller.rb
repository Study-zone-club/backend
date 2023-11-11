class SchedulesController < ApplicationController
  before_action :authorize_request
  before_action :set_schedule, only: %i[ show update destroy ]

  # GET /schedules
  def index
    @schedules = @current_user.schedules

    render json: @schedules
  end

  # GET /schedules/1
  def show
    if (@schedule.length == 0)
      render json: { message: "No schedules to show" }, status: :not_found
    else
      render json: @schedule[0]
    end
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = @current_user.id

    if @schedule.save
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.length == 0
      render json: { message: "No schedules to update" }, status: :not_found
    else
      if @schedule.update(schedule_params)
        render json: @schedule
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = @current_user.schedules.where(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:days_of_week, :from, :to, :subject_id)
    end
end
