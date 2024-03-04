# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Universities', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    Rails.application.load_seed
    login
  end

  it '(Sunny Day) Valid Name' do
    visit new_university_path

    fill_in 'University', with: 'Texas A&M'
    click_on 'Save'

    expect(page).to(have_content('Texas A&M'))
  end

  it '(Rainy Day) No Name' do
    visit new_university_path

    fill_in 'University', with: ''
    click_on 'Save'

    expect(page).to(have_content("University can't be blank"))
  end

  it '(Rainy Day) Duplicate Name' do
    University.create!(
      University: 'Dupe Uni'
    )

    visit new_university_path

    fill_in 'University', with: 'Dupe Uni'
    click_on 'Save'

    expect(page).to(have_content('University has already been taken'))
  end
end
