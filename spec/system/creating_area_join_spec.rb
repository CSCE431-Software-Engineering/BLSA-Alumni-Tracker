require 'rails_helper'

RSpec.describe "Creating Area Join", type: :system do
  before do
    driven_by(:rack_test)
  end


  it "Sunny day: creating area join" do
    visit new_area_join_path

    fill_in 'practice_area', with 'Civil Law'
    click_on 'Add Practice Area'
    expect(page).to have_content('Civil Law')
  end


  it "Rainy day: no practice area" do
    visit new_area_join_path

    fill_in 'practice_area', with ''

    expect(page).to have_content('Please Select a practice area')
  end
end