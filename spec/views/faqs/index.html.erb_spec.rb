# spec/views/faqs/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  it "displays the FAQ questions" do
    render

    expect(rendered).to match(/Where can I get assistance?/)
    expect(rendered).to match(/What is the purpose of this application?/)
    expect(rendered).to match(/How do I get started?/)
    expect(rendered).to match(/How do I edit my information?/)
    expect(rendered).to match(/How do I delete my account?/)
    expect(rendered).to match(/How do I get a valid link to my LinkedIn profile?/)
    expect(rendered).to match(/How do I add my education information?/)
    expect(rendered).to match(/How do I add a university option?/)
    expect(rendered).to match(/How do I add a location option?/)
    expect(rendered).to match(/Why can I not login with my TAMU email address?/)
  end
end