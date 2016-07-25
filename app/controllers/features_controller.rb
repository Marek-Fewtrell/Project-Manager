class FeaturesController < ApplicationController
  before_action :require_admin, only: [:edit, :destroy]
  before_action :require_user, only: [:index, :show, :update, :new, :create]

  def index
    @features = Feature.all
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @feature = Feature.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @feature = Feature.find(params[:id])
    @originalFeatureTitle = @feature.title
    if @feature.update(feature_params)
      #redirect_to(:action => 'show', :id => @feature.project.id)
      redirect_to project_path(@feature.project.id)
    else
      render 'edit'
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @feature = Feature.new
  end

  def create
    @project = Project.find(params[:project_id])
    @feature = @project.feature.create(feature_params)
    if @feature.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @feature = @project.feature.find(params[:id])
    @feature.destroy
    redirect_to project_path(@project)
  end

  private
  def feature_params
    params.require(:feature).permit(:title, :description, :status)
  end

end
