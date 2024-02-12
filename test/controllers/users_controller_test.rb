# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url,
           params: {
             user: {
               Current_Job: @user.Current_Job,
               Email: @user.Email,
               First_Name: @user.First_Name,
               Last_Name: @user.Last_Name,
               Linkedin_Profile: @user.Linkedin_Profile,
               Location: @user.Location,
               Middle_Name: @user.Middle_Name,
               Phone_Number: @user.Phone_Number,
               Profile_picture: @user.Profile_picture,
               is_Admin: @user.is_Admin
             }
           }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user),
          params: {
            user: {
              Current_Job: @user.Current_Job,
              Email: @user.Email,
              First_Name: @user.First_Name,
              Last_Name: @user.Last_Name,
              Linkedin_Profile: @user.Linkedin_Profile,
              Location: @user.Location,
              Middle_Name: @user.Middle_Name,
              Phone_Number: @user.Phone_Number,
              Profile_picture: @user.Profile_picture,
              is_Admin: @user.is_Admin
            }
          }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
