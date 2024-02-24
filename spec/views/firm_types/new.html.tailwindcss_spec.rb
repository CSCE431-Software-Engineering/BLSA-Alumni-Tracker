require 'rails_helper'

RSpec.describe "firm_types/new", type: :view do
  before(:each) do
    assign(:firm_type, FirmType.new(
      firm_type: "MyString"
    ))
  end

  it "renders new firm_type form" do
    render

    assert_select "form[action=?][method=?]", firm_types_path, "post" do

      assert_select "input[name=?]", "firm_type[firm_type]"
    end
  end
end
