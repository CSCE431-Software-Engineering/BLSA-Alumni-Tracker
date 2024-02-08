require 'rails_helper'

RSpec.describe "education_infos/new", type: :view do
  before(:each) do
    assign(:education_info, EducationInfo.new(
      semester: "MyString",
      grad_year: 1,
      university: "MyString",
      degree_type: "MyString"
    ))
  end

  it "renders new education_info form" do
    render

    assert_select "form[action=?][method=?]", education_infos_path, "post" do

      assert_select "input[name=?]", "education_info[semester]"

      assert_select "input[name=?]", "education_info[grad_year]"

      assert_select "input[name=?]", "education_info[university]"

      assert_select "input[name=?]", "education_info[degree_type]"
    end
  end
end
