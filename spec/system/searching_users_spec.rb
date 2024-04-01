# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'
require 'views_helper'

RSpec.describe('User Index', type: :system) do
  include ViewHelper

  before do
    driven_by(:rack_test)

    @user1 = create_user('user1@example.com', 'Law Firm', 'Tax Law', 'USA', 'California', 'Los Angeles')
    @user2 = create_user('user2@example.com', 'Government', 'Criminal Law', 'USA', 'New York', 'New York')
    @user3 = create_user('user3@example.com', 'Non-Profit', 'Environmental Law', 'Canada', 'Ontario', 'Toronto')

    Rails.application.load_seed
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    login
    @current_user = User.find_by(Email: 'csce431@gmail.com')
  end

  context 'when searching' do
    it '(Sunny Day) displays all users when nothing is searched' do
      visit users_path

      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 4))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'John Doe'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(4) td', text: 'Pauline Wade'))
    end

    it '(Sunny Day) displays the searched user by current job' do
      visit users_path
      fill_in 'search', with: 'Procrastinator'
      select 'Current Job', from: 'filter'
      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 3))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Pauline Wade'))
    end

    it '(Sunny Day) displays the searched user by practice area' do
      visit users_path
      fill_in 'search', with: 'Criminal Law'
      select 'Practice Area', from: 'filter'
      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 1))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'Pauline Wade'))
    end

    it '(Rainy Day) displays no users when search does not match any current job' do
      visit users_path
      fill_in 'search', with: 'nonexistent'
      select 'Current Job', from: 'filter'
      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 0))
    end

    it '(Rainy Day) displays no users when search does not match any practice area' do
      visit users_path
      fill_in 'search', with: 'nonexistent'
      select 'Practice Area', from: 'filter'
      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 0))
    end

    it '(Rainy Day) displays no users when searching class year with a non-number' do
      visit users_path
      fill_in 'search', with: 'abc'
      select 'Class Year', from: 'filter'
      click_on 'Search'

      expect(page).to(have_selector('table tbody tr', count: 0))
    end
  end

  context 'when sorting' do
    it '(Sunny Day) sorts users by name in ascending order' do
      visit users_path
      click_on 'Name'

      expect(page).to(have_selector('table tbody tr', count: 4))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(4) td', text: 'John Doe'))
    end

    it '(Sunny Day) sorts users by name in descending order' do
      visit users_path
      click_on 'Name'
      click_on 'Name'

      expect(page).to(have_selector('table tbody tr', count: 4))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'John Doe'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Pauline Wade'))
      expect(page).to(have_selector('table tbody tr:nth-child(4) td', text: 'Pauline Wade'))
    end

    it '(Sunny Day) sorts users by current job in ascending order' do
      visit users_path
      click_on 'Current Job'

      expect(page).to(have_selector('table tbody tr', count: 4))

      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'John Doe'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Procrastinator'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Procrastinator'))
      expect(page).to(have_selector('table tbody tr:nth-child(4) td', text: 'Procrastinator'))
    end

    it '(Sunny Day) sorts users by current job in descending order' do
      visit users_path
      click_on 'Current Job'
      click_on 'Current Job'

      expect(page).to(have_selector('table tbody tr', count: 4))
      expect(page).to(have_selector('table tbody tr:nth-child(1) td', text: 'Procrastinator'))
      expect(page).to(have_selector('table tbody tr:nth-child(2) td', text: 'Procrastinator'))
      expect(page).to(have_selector('table tbody tr:nth-child(3) td', text: 'Procrastinator'))
      expect(page).to(have_selector('table tbody tr:nth-child(4) td', text: 'John Doe'))
    end
  end
end
