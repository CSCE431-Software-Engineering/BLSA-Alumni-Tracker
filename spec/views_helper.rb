module ViewHelper
  def create_university (uni = 'Texas A&M')
    University.create!(
      University: uni
    )
  end

  def create_user(email = 'csce431@tamu.edu')
    User.create!(
      First_Name: 'Pauline',
      Last_Name: 'Wade',
      Middle_Name: 'idk',
      Profile_Picture: 'url.com',
      Email: email,
      Phone_Number: '1234567890',
      Current_Job: 'Procrastinator',
      Location: 'College Station',
      Linkedin_Profile: 'linkedin.com',
      is_Admin: true
    )
  end
end

RSpec.configure do |config|
  config.include(ViewHelper)
end