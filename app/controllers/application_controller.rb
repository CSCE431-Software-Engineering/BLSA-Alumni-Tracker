# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  before_action :set_current_user
  helper_method :current_user

  private

  def set_current_user(require_user = true)
    @current_user ||= User.find_by(Email: session[:email]) if session[:email].present?

    if require_user
      redirect_to(new_user_path, notice: 'Please create your profile first before attempting this.') if @user.blank? && !is_admin
    end
  end

  def is_admin
    session[:email] == 'blsa.tamu@gmail.com'
  end

  attr_reader :current_user
end
