# frozen_string_literal: true

require 'rails_helper'
require 'system_helper'

RSpec.describe('Deleting Education Info', type: :system) do
  before do
    driven_by(:rack_test)
    @education_info = EducationInfo.create!(
      Semester: 'Spring',
      Grad_Year: 2024,
      University: 'Texas A&M',
      Degree_Type: 'Bachelors'
    )
  end

  before(:each) do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    login
  end

  it '(Sunny Day) Delete Education Info' do
    visit education_info_path(@education_info.id)

    click_on 'Destroy this education info'

    expect(page).to(have_content('Education info was successfully destroyed.'))
  end
end
