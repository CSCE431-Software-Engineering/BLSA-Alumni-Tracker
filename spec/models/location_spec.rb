# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Location, type: :model) do
  it 'is not valid without a country' do
    location = described_class.new(country: nil)
    expect(location).not_to(be_valid)
  end

  it 'is not valid without a state' do
    location = described_class.new(state: nil)
    expect(location).not_to(be_valid)
  end

  it 'is not valid without a city' do
    location = described_class.new(city: nil)
    expect(location).not_to(be_valid)
  end
end
