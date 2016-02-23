class TasksController < ApplicationController
  before_filter :set_user, only: [ :create]
  before_filter :set_task, only: [ :update]

  def create
    @task = Task.new(task_params)
    @task.user = @user

    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def index
    @user = User.find(params[:id])
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def task_params
    params.require(:task).permit(
      :description,
      :due_date_on,
      :completed_on
    )
  end

end
