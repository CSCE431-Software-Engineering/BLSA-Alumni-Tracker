require 'rails_helper'

RSpec.describe "Deleting Education Info", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @education_info = EducationInfo.create!(
      Semester: "Spring",
      Grad_Year: 2024,
      University: "Texas A&M",
      Degree_Type: "Bachelors"
    )
  end

  it "(Sunny Day) Delete Education Info" do
    visit education_info_path(@education_info.id)

    click_on "Destroy this education info"

    expect(page).to have_content("Education info was successfully destroyed.")
  end
end
