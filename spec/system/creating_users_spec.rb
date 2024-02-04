require 'rails_helper'

RSpec.describe "CreatingUsers", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting user' do
    visit new_user_path

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Middle name', with: 'M'
    fill_in 'Profile picture', with: 'https://www.google.com'
    fill_in 'Email', with: 'JohnDoe@gmail.com'
    fill_in 'Phone number', with: '123-456-7890'
    fill_in 'Current job', with: 'Software Engineer'
    fill_in 'Location', with: 'New York'
    fill_in 'Linkedin profile', with: 'https://www.linkedin.com'
    check 'Is admin'

    click_on 'Create User'

    expect(page).to have_content('John')
    expect(page).to have_content('Doe')
    expect(page).to have_content('M')
    expect(page).to have_content('https://www.google.com')
    expect(page).to have_content('JohnDoe@gmail.com')
    expect(page).to have_content('123-456-7890')
    expect(page).to have_content('Software Engineer')
    expect(page).to have_content('New York')
    expect(page).to have_content('https://www.linkedin.com')
    expect(page).to have_content('true')
  end

end
