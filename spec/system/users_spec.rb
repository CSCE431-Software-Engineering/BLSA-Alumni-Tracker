require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is not valid without a First_Name' do
    user = User.new(First_Name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Last_Name' do
    user = User.new(Last_Name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Middle_Name' do
    user = User.new(Middle_Name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Profile_Picture' do
    user = User.new(Profile_Picture: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Email' do
    user = User.new(Email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Phone_Number' do
    user = User.new(Phone_Number: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Current_Job' do
    user = User.new(Current_Job: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Location' do
    user = User.new(Location: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a Linkedin_Profile' do
    user = User.new(Linkedin_Profile: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a is_Admin' do
    user = User.new(is_Admin: nil)
    expect(user).to_not be_valid
  end

end
