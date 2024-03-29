# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(University, type: :model) do
  describe 'Creating' do
    it '(Sunny Day) Valid University Name' do
      user = described_class.new(University: 'Test University')
      expect(user).to(be_valid)
    end

    it '(Rainy Day) No University Name' do
      user = described_class.new(University: nil)
      expect(user).not_to(be_valid)
    end
  end
end
