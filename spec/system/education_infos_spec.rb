require 'rails_helper'

RSpec.describe EducationInfo, type: :model do
  # Subject to be used between all tests (resets before each test)
  # More here: https://medium.com/@tomkadwill/all-about-rspec-let-a3b642e08d39
  let(:education_info) {
    EducationInfo.new(
      Semester: "Spring",
      Grad_Year: 2025,
      University: "Texas A&M",
      Degree_Type: "Bachelors"
    )
  }
  
  it "(Sunny Day) Create Valid Education Info" do
    expect(education_info).to be_valid
  end

  it "(Rainy Day) Empty Semester" do
    education_info.Semester = nil

    expect(education_info).not_to be_valid
  end

  describe "Graduation Year" do
    it "(Rainy Day) Empty Graduation Year" do
      education_info.Grad_Year = nil
      
      expect(education_info).not_to be_valid
    end

    it "(Rainy Day) Too Short Graduation Year" do
      education_info.Grad_Year = 319
      
      expect(education_info).not_to be_valid
    end

    it "(Rainy Day) Non-Numeric Graduation Year" do
      education_info.Grad_Year = "Not a number"
      
      expect(education_info).not_to be_valid
    end
  end

  it "(Rainy Day) Empty University" do
    education_info.University = nil
    
    expect(education_info).not_to be_valid
  end

  it "(Rainy Day) Empty Degree Type" do
    education_info.Degree_Type = nil
    
    expect(education_info).not_to be_valid
  end
end
