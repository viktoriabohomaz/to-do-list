# frozen_string_literal: true

module Api::V1
  class ProjectsController < ApiController
    load_and_authorize_resource through: :current_user

    def index
      render jsonapi: @projects, status: 200
    end

    def create
      if @project.save
        render jsonapi: @project, status: 200
      else
        render jsonapi_errors: @project.errors, status: 401
      end
    end

    def update
      if @project.update(project_params)
        render json: @project, status: 200
      else
        render jsonapi_errors: @project.errors, status: 401
      end
    end

    def destroy
      @project.destroy
      head :ok
    end

    private

    def project_params
      params.permit(:id, :description)
    end
  end
end
