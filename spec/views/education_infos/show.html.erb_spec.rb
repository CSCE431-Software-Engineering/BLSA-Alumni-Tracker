require 'rails_helper'

RSpec.describe "education_infos/show", type: :view do
  before(:each) do
    assign(:education_info, EducationInfo.create!(
      semester: "Semester",
      grad_year: 2,
      university: "University",
      degree_type: "Degree Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Semester/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/University/)
    expect(rendered).to match(/Degree Type/)
  end
end
