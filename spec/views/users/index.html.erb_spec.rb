# spec/views/users/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  def create_practice_area(practice_area)
    PracticeArea.find_or_create_by(practice_area: practice_area)
  end

  def create_firm_type(firm_type)
    FirmType.find_or_create_by(firm_type: firm_type)
  end

  def create_location(country, state, city)
    Location.find_or_create_by(country: country, state: state, city: city)
  end

  def create_university(name)
    University.find_or_create_by(University: name)
  end

  def create_user(email:, ft:, pa:, country:, state:, city:, university_name:, semester:, grad_year:, degree_type:)
    location = create_location(country, state, city)
    firm_type = create_firm_type(ft)
    practice_area = create_practice_area(pa)
    university = create_university(university_name)

    user = User.create!(
      First_Name: 'John',
      Last_Name: 'Doe',
      Middle_Name: 'M',
      Profile_Picture: 'https://www.google.com',
      Email: email,
      Phone_Number: '123-456-7890',
      Current_Job: 'Software Engineer',
      firm_type_id: firm_type.id,
      location_id: location.id,
      Linkedin_Profile: 'https://www.linkedin.com/in/john-doe',
      practice_areas: [practice_area],
      is_Admin: true
    )

    EducationInfo.create!(
      user: user,
      university: university,
      Semester: semester,
      Grad_Year: grad_year,
      Degree_Type: degree_type
    )

    user
  end

  before(:each) do
    @practice_area1 = create_practice_area('Tax Law')
    @practice_area2 = create_practice_area('Corporate Law')
    @firm_type = create_firm_type('Law Firm')
    @location = create_location('USA', 'New York', 'New York')
    @university = create_university('University of Example')

    @user1 = create_user(email: 'user1@example.com', ft: @firm_type.firm_type, pa: @practice_area1.practice_area, country: @location.country, state: @location.state, city: @location.city, university_name: @university.University, semester: 'Fall', grad_year: 2020, degree_type: 'Bachelor')
    @user2 = create_user(email: 'user2@example.com', ft: @firm_type.firm_type, pa: @practice_area2.practice_area, country: @location.country, state: @location.state, city: @location.city, university_name: @university.University, semester: 'Spring', grad_year: 2021, degree_type: 'Master')

    assign(:users, [@user1, @user2])
  end

  it 'displays the search form' do
    render

    expect(rendered).to have_selector('form input[name="search"]')
    expect(rendered).to have_selector('form select[name="filter"]')
    expect(rendered).to have_selector('form input[type="submit"]')
  end

  it 'displays the user list table' do
    render

    expect(rendered).to have_selector('table')
    expect(rendered).to have_selector('table thead tr')
    expect(rendered).to have_selector('table tbody tr', count: 2)
  end

  it 'displays the user details in the table' do
    render

    expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'John Doe')
    expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'Software Engineer')
    expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'Tax Law')

    expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'John Doe')
    expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'Software Engineer')
    expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'Corporate Law')
  end

  it 'displays the sorting links in the table headers' do
    render

    expect(rendered).to have_selector('table thead tr th a', text: 'Name')
    expect(rendered).to have_selector('table thead tr th a', text: 'Current Job')
    expect(rendered).to have_selector('table thead tr th a', text: 'Practice Areas')

  end
      
    context 'when searching' do
        it 'displays the searched users' do
        assign(:users, [@user1])
        params[:search] = 'user1'
        params[:filter] = 'name'

        render

        expect(rendered).to have_selector('table tbody tr', count: 1)
        expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'John Doe')
        end

        it 'displays no users when search does not match' do
        assign(:users, [])
        params[:search] = 'nonexistent'
        params[:filter] = 'name'

        render

        expect(rendered).to have_selector('table tbody tr', count: 0)
        end
    end

    context 'when sorting' do
        before do
        @user3 = create_user(email: 'user3@example.com', ft: @firm_type.firm_type, pa: @practice_area1.practice_area, country: @location.country, state: @location.state, city: @location.city, university_name: @university.University, semester: 'Summer', grad_year: 2019, degree_type: 'PhD')
        assign(:users, [@user1, @user2, @user3])
        end

        it 'sorts users by name in ascending order' do
        params[:sort_by] = 'name'
        params[:sort_direction] = 'asc'

        render

        expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'John Doe')
        expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'John Doe')
        expect(rendered).to have_selector('table tbody tr:nth-child(3) td', text: 'John Doe')
        end

        it 'sorts users by name in descending order' do
        params[:sort_by] = 'name'
        params[:sort_direction] = 'desc'

        render

        expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'John Doe')
        expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'John Doe')
        expect(rendered).to have_selector('table tbody tr:nth-child(3) td', text: 'John Doe')
        end

        it 'sorts users by current job in ascending order' do
        params[:sort_by] = 'current_job'
        params[:sort_direction] = 'asc'

        render

        expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'Software Engineer')
        expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'Software Engineer')
        expect(rendered).to have_selector('table tbody tr:nth-child(3) td', text: 'Software Engineer')
        end

        it 'sorts users by current job in descending order' do
        params[:sort_by] = 'current_job'
        params[:sort_direction] = 'desc'

        render

        expect(rendered).to have_selector('table tbody tr:nth-child(1) td', text: 'Software Engineer')
        expect(rendered).to have_selector('table tbody tr:nth-child(2) td', text: 'Software Engineer')
        expect(rendered).to have_selector('table tbody tr:nth-child(3) td', text: 'Software Engineer')
        end

    
  end
end