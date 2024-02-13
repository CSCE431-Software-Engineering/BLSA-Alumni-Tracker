# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Updating Education Info', type: :system) do
  before do
    driven_by(:rack_test)
    @education_info = EducationInfo.create!(
      Semester: 'Spring',
      Grad_Year: 2024,
      University: 'Texas A&M',
      Degree_Type: 'Bachelors'
    )
  end

  it '(Sunny Day) Update Semester' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_Semester', with: 'Summer'

    click_on 'Update Education info'

    expect(page).to(have_content('Summer'))
  end

  it '(Sunny Day) Update Graduation Year' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_Grad_Year', with: 2026

    click_on 'Update Education info'

    expect(page).to(have_content(2026.to_s))
  end

  it '(Sunny Day) Update University' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_University', with: 'UT Austin'

    click_on 'Update Education info'

    expect(page).to(have_content('UT Austin'))
  end

  it '(Sunny Day) Update Degree Type' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_Degree_Type', with: 'Masters in CS'

    click_on 'Update Education info'

    expect(page).to(have_content('Masters in CS'))
  end

  it '(Rainy Day) Empty Semester' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_Semester', with: ''

    click_on 'Update Education info'

    expect(page).to(have_content("Semester can't be blank"))
  end

  describe '(Rainy Day) Graduation Year' do
    it 'Empty Graduation Year' do
      visit edit_education_info_path(@education_info.id)

      fill_in 'education_info_Grad_Year', with: ''

      click_on 'Update Education info'

      expect(page).to(have_content("Grad year can't be blank"))
      expect(page).to(have_content('Grad year is too short'))
    end

    it 'Short Graduation Year' do
      visit edit_education_info_path(@education_info.id)

      fill_in 'education_info_Grad_Year', with: 205

      click_on 'Update Education info'

      expect(page).to(have_content('Grad year is too short'))
    end

    it 'Non-Numeric Graduation Year' do
      visit edit_education_info_path(@education_info.id)

      fill_in 'education_info_Grad_Year', with: 'asdf123'

      click_on 'Update Education info'

      expect(page).to(have_content("Grad year can't be blank"))
    end
  end

  it '(Rainy Day) Empty University' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_University', with: ''

    click_on 'Update Education info'

    expect(page).to(have_content("University can't be blank"))
  end

  it '(Rainy Day) Empty Degree Type' do
    visit edit_education_info_path(@education_info.id)

    fill_in 'education_info_Degree_Type', with: ''

    click_on 'Update Education info'

    expect(page).to(have_content("Degree type can't be blank"))
  end
end