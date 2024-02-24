require 'rails_helper'

RSpec.describe "firm_types/edit", type: :view do
  let(:firm_type) {
    FirmType.create!(
      firm_type: "MyString"
    )
  }

  before(:each) do
    assign(:firm_type, firm_type)
  end

  it "renders the edit firm_type form" do
    render

    assert_select "form[action=?][method=?]", firm_type_path(firm_type), "post" do

      assert_select "input[name=?]", "firm_type[firm_type]"
    end
  end
end
