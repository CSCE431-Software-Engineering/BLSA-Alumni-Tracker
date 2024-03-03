# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Creating Education Infos', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    Rails.application.load_seed
    login

    University.create!(
      University: 'Texas A&M University'
    )
  end

  it '(Sunny Day) Creating and Showing Education Info' do
    visit new_education_info_path

    fill_in 'Semester', with: 'Spring'
    fill_in 'Grad year', with: 2025
    select 'Texas A&M University', from: 'education_info_university_id'
    fill_in 'Degree type', with: 'Bachelors of Computer Science'

    click_on 'Create Education info'

    expect(page).to(have_content('Spring'))
    expect(page).to(have_content(2025))
    expect(page).to(have_content('Texas A&M University'))
    expect(page).to(have_content('Bachelors of Computer Science'))
  end

  it '(Rainy Day) No Semester' do
    visit new_education_info_path

    fill_in 'Semester', with: ''

    click_on 'Create Education info'

    expect(page).to(have_content('Semester can\'t be blank'))
  end

  describe 'Graduation Year' do
    it '(Rainy Day) No Graduation Year' do
      visit new_education_info_path

      fill_in 'Grad year', with: ''

      click_on 'Create Education info'

      expect(page).to(have_content('Grad year can\'t be blank'))
    end

    it '(Rainy Day) Too Short Graduation Year' do
      visit new_education_info_path

      fill_in 'Grad year', with: 123

      click_on 'Create Education info'

      expect(page).to(have_content('Grad year is too short'))
    end

    it '(Rainy Day) Non-Numeric Graduation Year' do
      visit new_education_info_path

      fill_in 'Grad year', with: 'abc123'

      click_on 'Create Education info'

      expect(page).to(have_content('Grad year is too short (minimum is 4 characters)'))
    end
  end

  it '(Rainy Day) No University' do
    visit new_education_info_path

    select '', from: 'education_info_university_id'

    click_on 'Create Education info'

    expect(page).to(have_content('University can\'t be blank'))
  end

  it '(Rainy Day) No Degree Type' do
    visit new_education_info_path

    fill_in 'Degree type', with: ''

    click_on 'Create Education info'

    expect(page).to(have_content('Degree type can\'t be blank'))
  end
end
