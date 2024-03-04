# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('universities/new', type: :view) do
  before do
    assign(:university, University.new)
  end

  it 'renders new university form' do
    render

    assert_select 'form[action=?][method=?]', universities_path, 'post' do
    end
  end
end
