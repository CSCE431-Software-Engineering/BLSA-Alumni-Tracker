require 'rails_helper'

RSpec.describe "firm_types/index", type: :view do
  before(:each) do
    assign(:firm_types, [
      FirmType.create!(
        firm_type: "Firm Type"
      ),
      FirmType.create!(
        firm_type: "Firm Type"
      )
    ])
  end

  it "renders a list of firm_types" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Firm Type".to_s), count: 2
  end
end
