require 'rails_helper'

RSpec.describe "firm_types/show", type: :view do
  before(:each) do
    assign(:firm_type, FirmType.create!(
      firm_type: "Firm Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firm Type/)
  end
end
