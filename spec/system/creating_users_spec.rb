# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('CreatingUsers', type: :system) do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    login

    #seed the test database for the practice area dropdown
    PracticeArea.create(practice_area: "Civil Litigation")
    PracticeArea.create(practice_area: "Agriculture Law")
    PracticeArea.create(practice_area: "Real Estate Law")


  end

  it '(Sunny Day) saves and displays the resulting user' do
    visit new_user_path

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Middle name', with: 'M'
    fill_in 'Profile picture', with: 'https://www.google.com'
    fill_in 'Phone number', with: '123-456-7890'
    fill_in 'Current job', with: 'Software Engineer'
    fill_in 'Location', with: 'New York'
    fill_in 'Linkedin profile', with: 'https://www.linkedin.com'
    select 'Civil Litigation', from: 'user_practice_area_ids'
    select 'Real Estate Law', from: 'user_practice_area_ids'
    check 'Is admin'

    click_on 'Create User'

    expect(page).to(have_content('John'))
    expect(page).to(have_content('Doe'))
    expect(page).to(have_content('M'))
    expect(page).to(have_content('https://www.google.com'))
    expect(page).to(have_content('csce431@tamu.edu'))
    expect(page).to(have_content('123-456-7890'))
    expect(page).to(have_content('Software Engineer'))
    expect(page).to(have_content('New York'))
    expect(page).to(have_content('https://www.linkedin.com'))
    expect(page).to(have_content('true'))
    expect(page).to have_content('Civil Litigation')
    expect(page).to have_content('Real Estate Law')
  end

  it '(Rainy Day) does not save the user if the First Name is missing' do
    visit new_user_path
    fill_in 'First name', with: ''
    click_on 'Create User'
    expect(page).to(have_content("First name can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Last Name is missing' do
    visit new_user_path
    fill_in 'Last name', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Last name can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Middle Name is missing' do
    visit new_user_path
    fill_in 'Middle name', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Middle name can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Profile Picture is missing' do
    visit new_user_path
    fill_in 'Profile picture', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Profile picture can't be blank"))
  end

  # this test is removed since the user no longer inputs the email address
  # it '(Rainy Day) does not save the user if the Email is missing' do
  #   visit new_user_path
  #   fill_in 'Email', with: ''
  #   click_on 'Create User'
  #   expect(page).to(have_content("Email can't be blank"))
  # end

  it '(Rainy Day) does not save the user if the Phone Number is missing' do
    visit new_user_path
    fill_in 'Phone number', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Phone number can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Current Job is missing' do
    visit new_user_path
    fill_in 'Current job', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Current job can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Location is missing' do
    visit new_user_path
    fill_in 'Location', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Location can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Linkedin Profile is missing' do
    visit new_user_path
    fill_in 'Linkedin profile', with: ''
    click_on 'Create User'
    expect(page).to(have_content("Linkedin profile can't be blank"))
  end

  it '(Rainy Day) does not save the user if the Practice Area is missing' do
    visit new_user_path
    click_on 'Create User'
    expect(page).to have_content("Practice areas can't be blank")
  end

end
