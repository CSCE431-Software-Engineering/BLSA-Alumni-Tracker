# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('universities/show', type: :view) do
  before do
    assign(:university, University.create!(University: 'Texas A&M'))

    # Define the helper method here to allow test case to pass
    def view.current_user_is_admin?
      false
    end

  end

  it 'renders attributes in <p>' do
    render
  end
end
