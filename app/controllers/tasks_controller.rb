class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # raise
    #find task by id and assign it to a variable
    # @task = Task.find(params[:id])
    # raise
    @task_status = completed?
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    #find task by id and assign it to a variable
  end

  def update
    #find task by id and assign it to a variable

    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    #find task by id and assign it to a variable
    @task.destroy

    redirect_to tasks_path
  end

  def completed?
    if @task.completed
      'This task is complete'
    else
      'This task is incomplete'
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
