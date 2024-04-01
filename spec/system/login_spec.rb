# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Login', type: :system) do
  before do
    driven_by(:rack_test)
    Rails.application.load_seed
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456789',
      info: {
        name: 'Pauline Wade',
        email: 'csce431@gmail.com'
      },
      credentials: {
        token: 'token',
        refresh_token: 'refresh token'
      }
    }
                                                                      )
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  def set_tamu_email
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456789',
      info: {
        name: 'Pauline Wade',
        email: 'csce431@tamu.edu'
      },
      credentials: {
        token: 'token',
        refresh_token: 'refresh token'
      }
    }
                                                                      )
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  it '(Sunny Day) Login with Non-TAMU email' do
    visit(root_path)
    click_button('Sign in with Google')

    expect(page).to(have_content('Successfully authenticated from Google account.'))
  end

  it '(Rainy Day) Login with TAMU email' do
    set_tamu_email

    visit(root_path)
    click_button('Sign in with Google')

    expect(page).to(have_content('Please use a personal email address. You will lose access to your tamu email address over time.'))
  end

  it '(Sunny Day) Logout' do
    visit(root_path)
    click_button('Sign in with Google')

    click_on('Sign Out')
    expect(page).to(have_content('Signed out successfully.'))
  end
end
