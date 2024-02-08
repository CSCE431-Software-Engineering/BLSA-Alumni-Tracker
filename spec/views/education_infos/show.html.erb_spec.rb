require 'rails_helper'

RSpec.describe "education_infos/show", type: :view do
  before(:each) do
    assign(:education_info, EducationInfo.create!(
      Semester: "Spring",
      Grad_Year: 2024,
      University: "Texas A&M",
      Degree_Type: "Bachelors"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Spring/)
    expect(rendered).to match(/2024/)
    expect(rendered).to match(/Texas A&amp;M/)
    expect(rendered).to match(/Bachelors/)
  end
end
