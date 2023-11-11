class SubjectsController < ApplicationController
  before_action :authorize_request
  before_action :set_subject, only: %i[ show update destroy ]

  # GET /subjects
  def index
    @subjects = @current_user.subjects

    render json: @subjects
  end

  # GET /subjects/1
  def show
    if (@subject.length == 0)
      render json: { message: "No subjects to show" }, status: :not_found
    else
      render json: @subject[0]
    end
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = @current_user.id

    if @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.length == 0
      render json: { message: "No subjects to update" }, status: :not_found
    else
      if @subject.update(subject_params)
        render json: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = @current_user.subjects.where(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:title, :area, :professor, :lapse, :notes, :power)
    end
end
