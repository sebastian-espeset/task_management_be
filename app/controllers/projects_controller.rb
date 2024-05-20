class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :authenticate_user!

    # GET /projects
  def index
    if current_user
      @projects = current_user.projects
      render json: @projects
    else
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end

  # GET /projects/:id
  def show
    
    if current_user
      render json: @project
    else
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end

  # POST /projects
  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy
  end

  private

   # This method sets @project before the show, update, and destroy actions
   def set_project
    Rails.logger.info "Current User: #{current_user.inspect}"
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
