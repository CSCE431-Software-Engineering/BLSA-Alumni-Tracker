# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('DeletingUsers', type: :system) do
  before do
    driven_by(:rack_test)
    @user = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: 'csce431@tamu.edu',
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      Location: 'New York',
      Linkedin_Profile: 'https://www.linkedin.com',
      is_Admin: true
    )
  end

  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    login
  end

  it '(Sunny Day) Delete User' do
    visit user_path(@user.id)

    click_on 'Delete this user'

    click_on 'Destroy this user'

    expect(page).to(have_content('User was successfully destroyed.'))
  end

  it '(Rainy Day) User cannot be deleted since it is not yours' do
    @user2 = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: 'NOTcsce431@tamu.edu',
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      Location: 'New York',
      Linkedin_Profile: 'https://www.linkedin.com',
      is_Admin: true
    )
    visit user_path(@user2.id)

    click_on 'Delete this user'

    expect(page).to(have_content('You can only delete your own profile.'))
  end

end
