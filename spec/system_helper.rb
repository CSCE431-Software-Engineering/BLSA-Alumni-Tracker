# frozen_string_literal: true

module SystemHelper
  def login
    # Create entry in "Admin"
    visit(root_path)
    click_button('Sign in with Google')

    # Actually create a user
    visit(new_user_path)
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Middle name', with: 'M'
    fill_in 'Profile picture', with: 'https://www.google.com'
    fill_in 'Phone number', with: '123-456-7890'
    fill_in 'Current job', with: 'Software Engineer'
    fill_in 'Location', with: 'New York'
    fill_in 'Linkedin profile', with: 'https://www.linkedin.com'
    check 'Is admin'
    click_on 'Create User'
  end

  def set_admin_false
    @user = User.find_by_Email("csce431@tamu.edu")
    @user.update(is_Admin: false)
  end

  def destroy_user
    @user = User.find_by_Email("csce431@tamu.edu")
    @user.destroy!
  end
end

RSpec.configure do |config|
  config.include(SystemHelper)
end
