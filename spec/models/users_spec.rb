# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  it 'is not valid without a First_Name' do
    user = described_class.new(First_Name: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Last_Name' do
    user = described_class.new(Last_Name: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Middle_Name' do
    user = described_class.new(Middle_Name: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Profile_Picture' do
    user = described_class.new(Profile_Picture: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Email' do
    user = described_class.new(Email: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Phone_Number' do
    user = described_class.new(Phone_Number: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Current_Job' do
    user = described_class.new(Current_Job: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a firm_type_id' do
    user = described_class.new(firm_type_id: nil)
    expect(user).not_to(be_valid)
  end

  # I'm not sure if this is the correct way test for location since it is based off location_id
  it 'is not valid without a Location' do
    user = described_class.new(location_id: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a Linkedin_Profile' do
    user = described_class.new(Linkedin_Profile: nil)
    expect(user).not_to(be_valid)
  end

  it 'is not valid without a is_Admin' do
    user = described_class.new(is_Admin: nil)
    expect(user).not_to(be_valid)
  end
end
