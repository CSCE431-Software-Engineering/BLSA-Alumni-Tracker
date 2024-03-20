# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EducationInfo, type: :model) do
  # Subject to be used between all tests (resets before each test)
  # More here: https://medium.com/@tomkadwill/all-about-rspec-let-a3b642e08d39

  let(:firm_type) do
    FirmType.create!(
      firm_type: 'Example Firm Type'
    )
  end

  let(:location_id) do
    Location.create!(
      country: 'USA',
      state: 'New York',
      city: 'New York'
    )
  end

  let(:practice_area) do
    PracticeArea.create!(
      practice_area: 'Test Practice Area'
    )
  end

  let(:user) do
    User.create!(
      First_Name: 'Pauline',
      Last_Name: 'Wade',
      Middle_Name: 'idk',
      Profile_Picture: 'url.com',
      Email: 'csce431@tamu.edu',
      Phone_Number: '1234567890',
      Current_Job: 'Procrastinator',
      Linkedin_Profile: 'https://www.linkedin.com/in/pauline-wade',
      firm_type_id: firm_type.id,
      location_id: location_id.id,
      practice_areas: [
        practice_area
      ],
      is_Admin: true
    )
  end

  let(:university) do
    University.create!(
      University: 'Texas A&M'
    )
  end

  let(:education_info) do
    described_class.new(
      Semester: 'Spring',
      Grad_Year: 2025,
      university_id: university.id,
      user_id: user.id,
      Degree_Type: 'Bachelors'
    )
  end

  it '(Sunny Day) Create Valid Education Info' do
    expect(education_info).to(be_valid)
  end

  it '(Rainy Day) Empty Semester' do
    education_info.Semester = nil

    expect(education_info).not_to(be_valid)
  end

  describe 'Graduation Year' do
    it '(Rainy Day) Empty Graduation Year' do
      education_info.Grad_Year = nil

      expect(education_info).not_to(be_valid)
    end

    it '(Rainy Day) Too Short Graduation Year' do
      education_info.Grad_Year = 319

      expect(education_info).not_to(be_valid)
    end

    it '(Rainy Day) Non-Numeric Graduation Year' do
      education_info.Grad_Year = 'Not a number'

      expect(education_info).not_to(be_valid)
    end
  end

  it '(Rainy Day) Empty University ID' do
    education_info.university_id = nil

    expect(education_info).not_to(be_valid)
  end

  it '(Rainy Day) Empty User ID' do
    education_info.user_id = nil

    expect(education_info).not_to(be_valid)
  end

  it '(Rainy Day) Empty Degree Type' do
    education_info.Degree_Type = nil

    expect(education_info).not_to(be_valid)
  end
end
