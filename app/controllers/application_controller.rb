# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user

private

  def set_current_user  
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end
end
