require 'rails_helper'

RSpec.describe "education_infos/edit", type: :view do
  let(:education_info) {
    EducationInfo.create!(
      semester: "MyString",
      grad_year: 1,
      university: "MyString",
      degree_type: "MyString"
    )
  }

  before(:each) do
    assign(:education_info, education_info)
  end

  it "renders the edit education_info form" do
    render

    assert_select "form[action=?][method=?]", education_info_path(education_info), "post" do

      assert_select "input[name=?]", "education_info[semester]"

      assert_select "input[name=?]", "education_info[grad_year]"

      assert_select "input[name=?]", "education_info[university]"

      assert_select "input[name=?]", "education_info[degree_type]"
    end
  end
end
