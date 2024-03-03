# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  private

  def set_current_user(require_user = true)
    @user = User.find_by(Email: session[:email])

    if require_user
      redirect_to(new_user_path, notice: 'Please create your profile before editing your profile.') if @user.blank? && !is_admin
    end
  end

  def is_admin
    session[:email] == 'blsa.tamu@gmail.com'
  end
end
