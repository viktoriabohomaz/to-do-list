# frozen_string_literal: true

module Api::V1
  class CommentsController < ApiController
    load_and_authorize_resource :task
    load_and_authorize_resource through: :task, shallow: true
    load_and_authorize_resource

    resource_description do
      short 'Project'
      api_versions 'v1'
      formats ['json']
      description <<-EOS
      ### Token Header Format
      The authentication information should be included by the client in the headers of each request. The headers follow the [RFC 6750 Bearer Token](http://tools.ietf.org/html/rfc6750) format:
      ##### Authentication headers example:
          "access-token": "wwwww",
          "token-type":   "Bearer",
          "client":       "xxxxx",
          "expiry":       "yyyyy",
          "uid":          "zzzzz"
      The authentication headers consists of the following params:
      | param | description |
      |---|---|
      | **`access-token`** | This serves as the user's password for each request. A hashed version of this value is stored in the database for later comparison. This value should be changed on each request. |
      | **`client`** | This enables the use of multiple simultaneous sessions on different clients. (For example, a user may want to be authenticated on both their phone and their laptop at the same time.) |
      | **`expiry`** | The date at which the current session will expire. This can be used by clients to invalidate expired tokens without the need for an API request. |
        | **`uid`** | A unique value that is used to identify the user. This is necessary because searching the DB for users by their access token will make the API susceptible to [timing attacks](http://codahale.com/a-lesson-in-timing-attacks/). |
      EOS
    end

    api :GET, '/api/v1/tasks/:task_id/comments', 'Show all comments from task'

    def index
      render jsonapi: @comments, status: 200
    end

    api :POST, '/api/v1/tasks/:task_id/comments', 'Create a new comment from task'
    param :text, String, required: true, desc: 'Text'
    param :image, String, required: false, desc: 'Image'
    error 422, 'Validation failed'

    def create
      if @comment.save
        render jsonapi: @comment, status: 200
      else
        render jsonapi_errors: @comment.errors, status: 422
      end
    end

    api :DELETE, '/api/v1/comments/:id', 'Delete comment'

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
