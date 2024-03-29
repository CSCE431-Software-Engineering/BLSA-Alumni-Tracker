# frozen_string_literal: true

module ViewHelper
  def create_university(uni = 'Texas A&M')
    University.create!(
      University: uni
    )
  end

  def create_user(email = 'csce431@tamu.edu', ft = 'Government', pa = 'Civil Litigation', country = 'USA', state = 'New York', city = 'New York')
    User.create!(
      First_Name: 'Pauline',
      Last_Name: 'Wade',
      Middle_Name: 'idk',
      Profile_Picture: 'url.com',
      Email: email,
      Phone_Number: '1234567890',
      Current_Job: 'Procrastinator',
      location_id: find_or_create_location(country, state, city).id,
      firm_type_id: find_or_create_firm_type(ft).id,
      practice_areas: [
        find_or_create_practice_area(pa)
      ],
      Linkedin_Profile: 'linkedin.com',
      is_Admin: true
    )
  end

  def find_or_create_firm_type(ft = 'Government')
    FirmType.find_or_create_by!(firm_type: ft)
  end

  def find_or_create_practice_area(pa = 'Civil Litigation')
    PracticeArea.find_or_create_by!(practice_area: pa)
  end

  def find_or_create_location(country = 'USA', state = 'New York', city = 'New York')
    Location.find_or_create_by!(country: country, state: state, city: city)
  end

  RSpec.configure do |config|
    config.include(ViewHelper)
  end
end
