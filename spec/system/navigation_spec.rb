# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Navigation', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.load_seed
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it '(Sunny Day) All navigation links are present' do
    visit(root_path)

    expect(page).to(have_content('Dashboard'))
    expect(page).to(have_content('My Profile'))
    expect(page).to(have_content('My Education Information'))
    expect(page).to(have_content('Sign Out'))
  end

  it '' do
    # TODO: : Add search tests
  end
end
