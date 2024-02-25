# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('universities/edit', type: :view) do
  let(:university) do
    University.create!
  end

  before do
    assign(:university, university)
  end

  it 'renders the edit university form' do
    render

    assert_select 'form[action=?][method=?]', university_path(university), 'post' do
    end
  end
end
