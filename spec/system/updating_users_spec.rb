# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Updating Users', type: :system) do
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
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

    login
  end

  # it 'does not save the user if the First Name is missing' do
  #   visit edit_user_path
  #   fill_in 'First name', with: ''
  #   click_on 'Update User'
  #   expect(page).to have_content("First name can't be blank")
  # end

  it '(Sunny Day) Update First Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_First_Name', with: 'Jane'

    click_on 'Update User'

    expect(page).to(have_content('Jane'))
  end

  it '(Rainy Day) Empty First Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_First_Name', with: ''

    click_on 'Update User'

    expect(page).to(have_content("First name can't be blank"))
  end

  it '(Sunny Day) Update Last Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Last_Name', with: 'Smith'

    click_on 'Update User'

    expect(page).to(have_content('Smith'))
  end

  it '(Rainy Day) Empty Last Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Last_Name', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Last name can't be blank"))
  end

  it '(Sunny Day) Update Middle Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Middle_Name', with: 'L'

    click_on 'Update User'

    expect(page).to(have_content('L'))
  end

  it '(Rainy Day) Empty Middle Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Middle_Name', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Middle name can't be blank"))
  end

  it '(Sunny Day) Update Profile Picture' do
    visit edit_user_path(@user.id)

    fill_in 'user_Profile_Picture', with: 'https://www.facebook.com'

    click_on 'Update User'

    expect(page).to(have_content('https://www.facebook.com'))
  end

  it '(Rainy Day) Empty Profile Picture' do
    visit edit_user_path(@user.id)

    fill_in 'user_Profile_Picture', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Profile picture can't be blank"))
  end

  # these tests should be removed since the user no longer enters their own email
  # it '(Sunny Day) Update Email' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Email', with: 'JaneSmith@gmail.com'

  #   click_on 'Update User'

  #   expect(page).to(have_content('JaneSmith@gmail.com'))
  # end

  # it '(Rainy Day) Empty Email' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Email', with: ''

  #   click_on 'Update User'

  #   expect(page).to(have_content("Email can't be blank"))
  # end

  it '(Sunny Day) Update Phone Number' do
    visit edit_user_path(@user.id)

    fill_in 'user_Phone_Number', with: '555-555-5555'

    click_on 'Update User'

    expect(page).to(have_content('555-555-5555'))
  end

  it '(Rainy Day) Empty Phone Number' do
    visit edit_user_path(@user.id)

    fill_in 'user_Phone_Number', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Phone number can't be blank"))
  end

  it '(Sunny Day) Update Current Job' do
    visit edit_user_path(@user.id)

    fill_in 'user_Current_Job', with: 'Lawyer'

    click_on 'Update User'

    expect(page).to(have_content('Lawyer'))
  end

  it '(Rainy Day) Empty Current Job' do
    visit edit_user_path(@user.id)

    fill_in 'user_Current_Job', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Current job can't be blank"))
  end

  it '(Sunny Day) Update Location' do
    visit edit_user_path(@user.id)

    fill_in 'user_Location', with: 'Los Angeles'

    click_on 'Update User'

    expect(page).to(have_content('Los Angeles'))
  end

  it '(Rainy Day) Empty Location' do
    visit edit_user_path(@user.id)

    fill_in 'user_Location', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Location can't be blank"))
  end

  it '(Sunny Day) Update Linkedin Profile' do
    visit edit_user_path(@user.id)

    fill_in 'user_Linkedin_Profile', with: 'https://www.myspace.com'

    click_on 'Update User'

    expect(page).to(have_content('https://www.myspace.com'))
  end

  it '(Rainy Day) Empty Linkedin Profile' do
    visit edit_user_path(@user.id)

    fill_in 'user_Linkedin_Profile', with: ''

    click_on 'Update User'

    expect(page).to(have_content("Linkedin profile can't be blank"))
  end

  it '(Rainy Day) User cannot edit a profile that is not theirs' do
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

    click_on 'Edit this user'

    click_on 'Update User'

    expect(page).to(have_content('You can only update your own profile.'))
  end
end
