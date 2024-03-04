# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Updating Universities', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.load_seed
    @university = University.create!(
      University: 'Texas A&M University'
    )

    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    login

    @user = User.find_by(Email: 'csce431@tamu.edu')
  end

  it '(Sunny Day) Valid University Name' do
    visit edit_university_path(@university.id)

    fill_in 'University', with: 'Another test uni'
    click_on 'Save'

    expect(page).to(have_content('Another test uni'))
  end

  it '(Rainy Day) Empty University Name' do
    visit edit_university_path(@university.id)

    fill_in 'University', with: ''
    click_on 'Save'

    expect(page).to(have_content("University can't be blank"))
  end

  it '(Rainy Day) Update with Duplicate Name' do
    visit edit_university_path(@university.id)

    University.create!(
      University: 'Copy Uni'
    )
    fill_in 'University', with: 'Copy Uni'
    click_on 'Save'

    expect(page).to(have_content('University has already been taken'))
  end

  it '(Rainy Day) Not an Admin' do
    set_admin_false
    visit edit_university_path(@university.id)

    expect(page).to(have_content('Only admins can update universities.'))
  end
end
