class TasksController < ApplicationController
  before_action :require_admin, only: [:edit, :destroy]
  before_action :require_user, only: [:index, :show, :update, :new, :create]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @originalTaskTitle = @task.title
    if @task.update(task_params)
      #redirect_to(:action => 'show', :id => @task.project.id)
      redirect_to project_path(@task.project.id)
    else
      render 'edit'
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.task.create(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.task.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

end
