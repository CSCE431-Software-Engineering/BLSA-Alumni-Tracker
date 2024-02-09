require 'rails_helper'

RSpec.describe "Creating Education Infos", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "(Sunny Day) Creating and Showing Education Info" do
    visit new_education_info_path

    fill_in 'Semester', with: 'Spring'
    fill_in 'Grad Year', with: 2025
    fill_in 'University', with: 'Texas A&M University'
    fill_in 'Degree type', with: 'Bachelors of Computer Science'

    click_on 'Create Education info'

    expect(page).to have_content('Spring')
    expect(page).to have_content(2025)
    expect(page).to have_content('Texas A&M University')
    expect(page).to have_content('Bachelors of Computer Science')
  end

  it "(Rainy Day) No Semester" do
    visit new_education_info_path

    fill_in 'Semester', with: ''

    click_on 'Create Education info'

    expect(page).to have_content('Semester can\'t be blank')
  end

  describe "Graduation Year" do
    it "(Rainy Day) No Graduation Year" do
      visit new_education_info_path

      fill_in 'Grad year', with: ''

      click_on 'Create Education info'

      expect(page).to have_content("Grad year can't be blank")
    end

    it "(Rainy Day) Too Short Graduation Year" do
      visit new_education_info_path

      fill_in 'Grad year', with: 123

      click_on 'Create Education info'

      expect(page).to have_content("Grad year is too short")
    end

    it "(Rainy Day) Non-Numeric Graduation Year" do
      visit new_education_info_path

      fill_in 'Grad year', with: "abc123"

      click_on 'Create Education info'

      expect(page).to have_content("Grad year can't be blank")
    end
  end

  it "(Rainy Day) No University" do
    visit new_education_info_path

    fill_in 'University', with: ''

    click_on 'Create Education info'

    expect(page).to have_content("University can't be blank")
  end

  it "(Rainy Day) No Degree Type" do
    visit new_education_info_path

    fill_in 'Degree type', with: ''

    click_on 'Create Education info'

    expect(page).to have_content("Degree type can't be blank")
  end

end
