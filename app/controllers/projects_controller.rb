class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:error] =  "Project could not be saved."
      render :new
    end
  end

  def show
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated'
    else render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to project_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end