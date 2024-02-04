require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Current job", with: @user.Current_Job
    fill_in "Email", with: @user.Email
    fill_in "First name", with: @user.First_Name
    fill_in "Last name", with: @user.Last_Name
    fill_in "Linkedin profile", with: @user.Linkedin_Profile
    fill_in "Location", with: @user.Location
    fill_in "Middle name", with: @user.Middle_Name
    fill_in "Phone number", with: @user.Phone_Number
    fill_in "Profile picture", with: @user.Profile_picture
    check "Is admin" if @user.is_Admin
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Current job", with: @user.Current_Job
    fill_in "Email", with: @user.Email
    fill_in "First name", with: @user.First_Name
    fill_in "Last name", with: @user.Last_Name
    fill_in "Linkedin profile", with: @user.Linkedin_Profile
    fill_in "Location", with: @user.Location
    fill_in "Middle name", with: @user.Middle_Name
    fill_in "Phone number", with: @user.Phone_Number
    fill_in "Profile picture", with: @user.Profile_picture
    check "Is admin" if @user.is_Admin
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
