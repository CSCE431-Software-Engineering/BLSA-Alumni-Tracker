require 'rails_helper'

RSpec.describe "Universities", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "(Sunny Day) Valid Name" do
    visit new_university_path

    fill_in "University Name", with: "Texas A&M"
    click_on "Create University"

    expect(page).to(have_content("Texas A&M"))
  end
end
