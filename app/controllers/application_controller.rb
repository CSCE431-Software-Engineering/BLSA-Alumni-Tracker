# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  before_action :set_current_user
  helper_method :current_user

  private

  def set_current_user
    @current_user ||= User.find_by(Email: session[:email]) if session[:email].present?
  end

  attr_reader :current_user
end
