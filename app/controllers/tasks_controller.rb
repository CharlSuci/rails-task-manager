class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    @task.save
    redirect_to task_path(@task)
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
