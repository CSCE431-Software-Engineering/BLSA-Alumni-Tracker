# frozen_string_literal: true

module UsersHelper
  def current_user_is_admin?
    logged_in_user = User.find_by(Email: session[:email])
    logged_in_user&.is_Admin
  end
end
