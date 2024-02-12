require 'rails_helper'

RSpec.describe "DeletingUsers", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.create!(
      First_Name: "John",
      Last_Name: "Doe",
      Middle_Name: "M",
      Profile_Picture: "https://www.google.com",
      Email: "JohnDoe@gmail.com",
      Phone_Number: "123-456-7890",
      Current_Job: "Software Engineer",
      Location: "New York",
      Linkedin_Profile: "https://www.linkedin.com",
      is_Admin: true
    )
  end

  it "(Sunny Day) Delete User" do
    visit user_path(@user.id)

    click_on "Delete this user"

    click_on "Destroy this user"

    expect(page).to have_content("User was successfully destroyed.")
  end
end
