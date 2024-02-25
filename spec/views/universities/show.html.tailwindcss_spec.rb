# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('universities/show', type: :view) do
  before do
    assign(:university, University.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
