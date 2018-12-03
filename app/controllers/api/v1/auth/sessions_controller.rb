# frozen_string_literal: true

module Api::V1::Auth
  class SessionsController < DeviseTokenAuth::SessionsController
    before_action :configure_permitted_parameters, only: :create

    resource_description do
      short 'Users sign in'
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

    api :POST, '/auth/sign_in', 'Create session'
    param :nickname, String, required: true, desc: 'Nickname'
    param :password, String, required: true, desc: 'Password'
    error 422, 'Validation failed'
    def create
      super
    end

    api :DELETE, '/auth/sign_out', 'Destroy session'
    def destroy
      super
    end
    private

    def render_create_success
      render jsonapi: @resource, status: :success
    end

    def render_create_error_bad_credentials
      render json: SerializableError.call(
        title: 'Invalid credentials',
        detail: I18n.t('devise_token_auth.sessions.bad_credentials'),
      ), status: 422
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %I[nickname])
    end
  end
end
