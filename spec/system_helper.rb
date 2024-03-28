# frozen_string_literal: true

module SystemHelper
  def login
    # Create entry in "Admin"
    visit(root_path)
    click_button('Sign in with Google')

    # Actually create a user
    visit(new_user_path)
    fill_in('user_First_Name', with: 'John')
    fill_in('user_Last_Name', with: 'Doe')
    fill_in('user_Middle_Name', with: 'M')
    fill_in('user_Profile_Picture', with: 'https://www.google.com')
    fill_in('user_Phone_Number', with: '123-456-7890')
    fill_in('user_Current_Job', with: 'Software Engineer')
    select('Government', from: 'user_firm_type_id')
    fill_in('user_location_attributes_country', with: 'USA')
    fill_in('user_location_attributes_state', with: 'New York')
    fill_in('user_location_attributes_city', with: 'New York')
    fill_in('user_Linkedin_Profile', with: 'https://www.linkedin.com/in/john-doe')
    select('Civil Litigation', from: 'user_practice_area_ids')
    select('Real Estate Law', from: 'user_practice_area_ids')
    click_on('Save')
  end

  def set_admin_false
    @user = User.find_by(Email: 'csce431@gmail.com')
    @user.update!(is_Admin: false)
  end

  def set_admin_true
    @user = User.find_by(Email: 'csce431@gmail.com')
    @user.update!(is_Admin: true)
  end

  def destroy_user
    @user.destroy! if @user = User.find_by(Email: 'csce431@gmail.com')
  end
end

RSpec.configure do |config|
  config.include(SystemHelper)
end
