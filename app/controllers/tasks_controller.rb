class TasksController < ApplicationController
  before_action :authorize_request
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  def index
    @tasks = @current_user.tasks

    render json: @tasks
  end

  # GET /tasks/1
  def show
    if (@task.length === 0)
      render json: { message: "No tasks to show" }, status: :not_found
    else
      render json: @task
    end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = @current_user.id

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if (@task.is_completed == false)
      if @task.update(task_edit_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "Task has been completed, cannot be modify" }, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    if (@task.is_completed)
      @task.destroy
      render json: { message: "#{@task.title} has been destroy" }, status: :ok
    else
      render json: { message: "#{@task.title} cannot been destroy" }, status: :unprocessable_entity
    end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @current_user.tasks.where(id: params[:id])[0]
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description)
    end

    def task_edit_params
      params.require(:task).permit(:title, :description, :is_completed)
    end
  end
end
