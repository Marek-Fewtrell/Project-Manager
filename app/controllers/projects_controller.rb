class ProjectsController < ApplicationController
  before_action :require_admin, only: [:edit, :destroy]
  before_action :require_user, only: [:index, :show, :update, :new, :create]

  @currentPage;

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @currentPage = 'edit'
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @originalProjectTitle = @project.title
    if @project.update(project_params)
      redirect_to(:action => 'show', :id => @project.id)
    else
      @currentPage = 'edit'
      render 'edit'
    end
  end

  def new
    @currentPage = 'new'
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      @currentPage = 'new'
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :dev_env, :prod_env, :language_desc)
  end

end
