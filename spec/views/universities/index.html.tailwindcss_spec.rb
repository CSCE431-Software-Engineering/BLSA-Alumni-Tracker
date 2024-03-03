# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('universities/index', type: :view) do
  before do
    assign(:universities, [
      University.create!(University: 'Texas A&M'),
      University.create!(University: 'UT Dallas')
    ]
    )
  end

  it 'renders a list of universities' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
