# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Deleting Universities', type: :system) do
  before do
    driven_by(:rack_test)

    @university = University.create!(
      University: 'Test University'
    )
    Rails.application.load_seed
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    login

    @user = User.find_by(Email: 'csce431@tamu.edu')
  end

  it '(Sunny Day) Delete University as Admin' do
    visit university_path(@university.id)

    click_on 'Delete University'

    expect(page).to(have_content('University was successfully destroyed.'))
  end

  it '(Rainy Day) Delete University as Non-Admin' do
    set_admin_false
    visit university_path(@university.id)

    click_on 'Delete University'

    expect(page).to(have_content('Only admins can delete universities.'))
  end
end
