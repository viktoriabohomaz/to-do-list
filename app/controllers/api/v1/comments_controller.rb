# frozen_string_literal: true

module Api::V1
  class CommentsController < ApiController
    load_and_authorize_resource through: :current_user

    def index
      render jsonapi: @comments, status: 200
    end

    def create
      if @comment.save
        render jsonapi: @comment, status: 200
      else
        render jsonapi_errors: @comment.errors, status: 401
      end
    end

    def update
      if @comment.update(comment_params)
        render jsonapi: @comment, status: 200
      else
        render jsonapi_errors: @comment.errors, status: 401
      end
    end

    def destroy
      @comment.destroy
      head :ok
    end

    private

    def comment_params
      params.permit(:id, :text, :image)
    end
  end
end
