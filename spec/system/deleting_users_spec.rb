# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Deleting Users', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.load_seed
    @firm_type = FirmType.find_by(firm_type: 'Government')
    @practice_area = PracticeArea.find_by(practice_area: 'Commercial Law')
    @location_id = Location.create!(
      country: 'USA',
      state: 'New York',
      city: 'New York'
    )
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

    @user2 = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: 'NOTcsce431@tamu.edu',
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      firm_type_id: @firm_type.id,
      location_id: @location_id.id,
      Linkedin_Profile: 'https://www.linkedin.com',
      practice_areas: [@practice_area],
      is_Admin: true
    )

    login
  end

  it '(Sunny Day) Delete User' do
    visit delete_user_path(User.find_by(Email: 'csce431@tamu.edu').id)

    click_on 'Destroy this user'

    expect(page).to(have_content('User was successfully destroyed.'))
  end

  it '(Rainy Day) User cannot be deleted since it is not yours' do
    set_admin_false

    visit delete_user_path(@user2.id)

    expect(page).to(have_content('You can only delete your own profile.'))
  end

  it '(Sunny Day) Admin user can delete a user that is not themself' do

    visit delete_user_path(@user2.id)

    click_on 'Destroy this user'

    expect(page).to(have_content('User was successfully destroyed.'))
  end
end
