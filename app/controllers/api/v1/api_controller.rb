# frozen_string_literal: true

module Api::V1
  class ApiController < ::ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery with: :null_session

    before_action :authenticate_user!

    rescue_from CanCan::AccessDenied do |exception|
      render json: SerializableError.call(
        title: 'Access Denied',
        detail: exception.message
      ), status: :forbidden
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: SerializableError.call(
        title: 'Record Not Found',
        detail: exception.message
      ), status: :not_found
    end
  end
end
