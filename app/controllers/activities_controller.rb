class ActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_activity, only: %i[ show update destroy ]

  # GET /activities
  def index
    @activities = @current_user.activities

    render json: @activities
  end

  # GET /activities/1
  def show
    if (@activity.length == 0)
      render json: { message: "No activities to show" }, status: :not_found
    else
      render json: @activity[0]
    end
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = @current_user.id

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.length == 0
      render json: { message: "No activities to update" }, status: :not_found
    else
      if @activity.update(activity_params)
        render json: @activity
      else
        render json: @activity.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /activities/1
  def destroy
    Activity.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = @current_user.activities.where(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:title, :calification, :subject_id)
  end
end
