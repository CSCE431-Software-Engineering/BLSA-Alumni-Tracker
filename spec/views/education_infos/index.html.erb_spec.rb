require 'rails_helper'

RSpec.describe "education_infos/index", type: :view do
  before(:each) do
    assign(:education_infos, [
      EducationInfo.create!(
        Semester: "Semester",
        Grad_Year: 2,
        University: "University",
        Degree_Type: "Degree Type"
      ),
      EducationInfo.create!(
        Semester: "Semester",
        Grad_Year: 2,
        University: "University",
        Degree_Type: "Degree Type"
      )
    ])
  end

  it "renders a list of education_infos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Semester".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("University".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Degree Type".to_s), count: 2
  end
end
