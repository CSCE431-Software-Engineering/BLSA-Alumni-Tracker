# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{practice_area: "Star Wars" }, {practice_area: "Lord of the Rings" }])
#   Character.createpractice_area: "Luke", movie: movies.first)

practice_areas = [
  { practice_area: 'Dispute Resolution' },
  { practice_area: 'Agriculture Law' },
  { practice_area: 'Business Law' },
  { practice_area: 'Civil Litigation' },
  { practice_area: 'Commercial Law' },
  { practice_area: 'Criminal Law and Procedure' },
  { practice_area: 'Energy Law' },
  { practice_area: 'Environmental Law' },
  { practice_area: 'Estate Planning' },
  { practice_area: 'Family Law' },
  { practice_area: 'General Practice' },
  { practice_area: 'Health Law' },
  { practice_area: 'Immigration Law' },
  { practice_area: 'IP and Technology Law' },
  { practice_area: 'Oil and Gas Law' },
  { practice_area: 'Real Estate Law' },
  { practice_area: 'Water Law' },
  { practice_area: 'Workplace Law' },
  { practice_area: 'N/A' }
]

# Create Practice Areas
practice_areas.each do |area|
  PracticeArea.find_or_create_by!(area)
end

firm_types = [
  { firm_type: 'Government' },
  { firm_type: 'Solo' },
  { firm_type: 'Small' },
  { firm_type: 'Medium' },
  { firm_type: 'Big Law' },
  { firm_type: 'In-house' },
  { firm_type: 'N/A' }
]

firm_types.each do |type|
  FirmType.find_or_create_by!(type)
end

# Universities
universities = [
  { University: 'Texas A&M School of Law' }
]

universities.each do |uni|
  University.find_or_create_by!(uni)
end

locations = [
  { country: 'N/A', state: 'N/A', city: 'N/A' }
]

locations.each do |loc|
  Location.find_or_create_by!(loc)
end

na_location = Location.find_by!(country: 'N/A', state: 'N/A', city: 'N/A')
na_practice_area = PracticeArea.find_by!(practice_area: 'N/A')
na_firm_type = FirmType.find_by!(firm_type: 'N/A')

users = [
  # make blsa email account first name BLSA last name Admin so that it looks better in admin search
  {
    First_Name: 'BLSA Admin',
    Last_Name: 'N/A',
    Middle_Name: 'N/A',
    Profile_Picture: 'N/A',
    Email: 'blsa.tamu@gmail.com',
    Phone_Number: 'N/A',
    Current_Job: 'Root Admin',
    location_id: na_location.id,
    firm_type_id: na_firm_type.id,
    practice_areas: [na_practice_area],
    is_Admin: true
  }
]
# Development only
if Rails.env.development?
  users << {
    First_Name: 'Sam Admin',
    Last_Name: 'N/A',
    Middle_Name: 'N/A',
    Profile_Picture: 'N/A',
    Email: 'samdcole48@gmail.com',
    Phone_Number: 'N/A',
    Current_Job: 'Test Admin',
    location_id: na_location.id,
    firm_type_id: na_firm_type.id,
    practice_areas: [na_practice_area],
    is_Admin: true
  } << {
    First_Name: 'Admin Aidan',
    Last_Name: 'Queng',
    Email: 'tongqu777@gmail.com',
    Current_Job: 'Test Admin',
    location_id: na_location.id,
    firm_type_id: na_firm_type.id,
    practice_areas: [na_practice_area],
    is_Admin: true
  }
end

# must do it this way in order to associate the pratice_areas array
# This still prevents duplicates users.
users.each do |user|
  u = User.find_by(Email: user[:Email])
  if u.blank?
    u = User.create!(user)
  else
    u.assign_attributes(user)
  end
  u.save!
end
