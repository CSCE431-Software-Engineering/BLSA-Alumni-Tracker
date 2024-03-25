# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Updating Users', type: :system) do
  before do
    driven_by(:rack_test)

    Rails.application.load_seed
    @practice_area = PracticeArea.find_by(practice_area: 'Civil Litigation')
    @firm_type = FirmType.create!(
      firm_type: 'Example Firm Type'
    )
    @location_id = Location.create!(
      country: 'USA',
      state: 'New York',
      city: 'New York'
    )

    @user = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: 'csce431@tamu.edu',
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      firm_type_id: @firm_type.id,
      location_id: @location_id.id,
      Linkedin_Profile: 'https://www.linkedin.com/in/john-doe',
      practice_areas: [@practice_area],
      is_Admin: true
    )

    @user2 = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: 'NOTcsce431@tamu.edu',
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      firm_type_id: @firm_type.id,
      # Location: 'New York',
      location_id: @location_id.id,
      Linkedin_Profile: 'https://www.linkedin.com/in/john-doe',
      practice_areas: [@practice_area],
      is_Admin: true
    )

    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

    login
  end

  # it 'does not save the user if the First Name is missing' do
  #   visit edit_user_path
  #   fill_in 'First name', with: ''
  #   click_on 'Save'
  #   expect(page).to have_content("First name can't be blank")
  # end

  it '(Sunny Day) Update First Name' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_First_Name', with: 'Jane'

    click_on 'Save'

    expect(page).to(have_content('Jane'))
  end

  it '(Rainy Day) Empty First Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_First_Name', with: ''

    click_on 'Save'

    expect(page).to(have_content("First name can't be blank"))
  end

  it '(Sunny Day) Update Last Name' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Last_Name', with: 'Smith'

    click_on 'Save'

    expect(page).to(have_content('Smith'))
  end

  it '(Rainy Day) Empty Last Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Last_Name', with: ''

    click_on 'Save'

    expect(page).to(have_content("Last name can't be blank"))
  end

  it '(Sunny Day) Update Middle Name' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Middle_Name', with: 'L'

    click_on 'Save'

    expect(page).to(have_content('L'))
  end

  it '(Rainy Day) Empty Middle Name' do
    visit edit_user_path(@user.id)

    fill_in 'user_Middle_Name', with: ''

    click_on 'Save'

    expect(page).to(have_content("Middle name can't be blank"))
  end

  it '(Sunny Day) Update Profile Picture' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Profile_Picture', with: 'https://www.facebook.com'

    click_on 'Save'

    expect(page).to(have_content('https://www.facebook.com'))
  end

  it '(Rainy Day) Empty Profile Picture' do
    visit edit_user_path(@user.id)

    fill_in 'user_Profile_Picture', with: ''

    click_on 'Save'

    expect(page).to(have_content("Profile picture can't be blank"))
  end

  # these tests should be removed since the user no longer enters their own email
  # it '(Sunny Day) Update Email' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Email', with: 'JaneSmith@gmail.com'

  #   click_on 'Save'

  #   expect(page).to(have_content('JaneSmith@gmail.com'))
  # end

  # it '(Rainy Day) Empty Email' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Email', with: ''

  #   click_on 'Save'

  #   expect(page).to(have_content("Email can't be blank"))
  # end

  it '(Sunny Day) Update Phone Number' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Phone_Number', with: '555-555-5555'

    click_on 'Save'

    expect(page).to(have_content('555-555-5555'))
  end

  it '(Rainy Day) Empty Phone Number' do
    visit edit_user_path(@user.id)

    fill_in 'user_Phone_Number', with: ''

    click_on 'Save'

    expect(page).to(have_content("Phone number can't be blank"))
  end

  it '(Sunny Day) Update Current Job' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Current_Job', with: 'Lawyer'

    click_on 'Save'

    expect(page).to(have_content('Lawyer'))
  end

  it '(Rainy Day) Empty Current Job' do
    visit edit_user_path(@user.id)

    fill_in 'user_Current_Job', with: ''

    click_on 'Save'

    expect(page).to(have_content("Current job can't be blank"))
  end

  it '(Sunny Day) Update Firm Type' do
    @firm_type_new = FirmType.create!(
      firm_type: 'New Firm Type'
    )
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    select @firm_type_new.firm_type, from: 'user_firm_type_id'

    click_on 'Save'

    expect(page).to(have_content(@firm_type_new.firm_type))
  end

  # not sure how to add rainy day case since user only has the options given to them

  # it '(Sunny Day) Update Location' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Location', with: 'Los Angeles'

  #   click_on 'Save'

  #   expect(page).to(have_content('Los Angeles'))
  # end

  # it '(Rainy Day) Empty Location' do
  #   visit edit_user_path(@user.id)

  #   fill_in 'user_Location', with: ''

  #   click_on 'Save'

  #   expect(page).to(have_content("Location can't be blank"))
  # end

  it '(Sunny Day) Update Linkedin Profile to valid url' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Linkedin_Profile', with: 'https://www.linkedin.com/in/john-doe2'

    click_on 'Save'

    expect(page).to(have_content('https://www.linkedin.com/in/john-doe2'))
  end

  it '(Sunny Day) Update Linkedin Profile to N/A' do
    visit edit_user_path(@user.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_Linkedin_Profile', with: 'N/A'

    click_on 'Save'

    expect(page).to(have_content('N/A'))
  end

  it '(Rainy Day) Empty Linkedin Profile' do
    visit edit_user_path(@user.id)

    fill_in 'user_Linkedin_Profile', with: ''

    click_on 'Save'

    expect(page).to(have_content("Linkedin profile can't be blank"))
  end

  it '(Rainy Day) Invalid Linkedin Profile url' do
    visit edit_user_path(@user.id)

    fill_in 'user_Linkedin_Profile', with: 'https://www.lonkedin.com/in/john-doe'

    click_on 'Save'

    expect(page).to(have_content("Linkedin profile must be 'N/A' or a valid LinkedIn URL"))
  end

  it '(Rainy Day) User cannot edit a profile that is not theirs' do
    set_admin_false

    visit edit_user_path(@user2.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_First_Name', with: 'Jane'

    click_on 'Save'

    expect(page).to(have_content('You can only update your own profile.'))
  end

  it '(Sunny Day) Admin users can edit a profile that is not theirs' do
    set_admin_true
    visit edit_user_path(@user2.id)

    # HARDCODED TESTS, REMOVE LATER AND FIX
    fill_in 'user_location_attributes_country', with: 'USA'
    fill_in 'user_location_attributes_state', with: 'New York'
    fill_in 'user_location_attributes_city', with: 'New York'

    fill_in 'user_First_Name', with: 'Jane'

    click_on 'Save'

    expect(page).to(have_content('Jane'))
  end
end
