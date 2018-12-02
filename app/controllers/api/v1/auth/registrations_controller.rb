# frozen_string_literal: true

module Api::V1::Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters, only: :create

    resource_description do
      short 'Users registration'
      api_versions 'v1'
      formats ['json']
    end

    api :POST, '/auth', 'Create new user'
    param :nickname, String, required: true, desc: 'Nickname'
    param :password, String, required: true, desc: 'Password'
    param :password_confirmation, String, required: false, desc: 'Password confirmation'
    error 422, 'Validation failed'
    def create
      super
    end

    protected

    def render_create_success
      render jsonapi: @resource, status: :created
    end

    def render_create_error
      render jsonapi_errors: @resource.errors, status: :forbidden
    end

    def build_resource
      @resource            = resource_class.new(sign_up_params)
      @resource.provider   = 'nickname'

      @resource.uid = @resource.nickname = if resource_class.case_insensitive_keys.include?(:nickname)
                                             sign_up_params[:nickname].try(:downcase)
                                           else
                                             sign_up_params[:nickname]
                                           end
    end

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %I[nickname])
    end
  end
end
