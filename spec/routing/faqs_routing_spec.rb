# frozen_string_literal: true

# spec/routing/faqs_routing_spec.rb
require 'rails_helper'

RSpec.describe 'routing to FAQs', type: :routing do
  it 'routes /faqs to faqs#index' do
    expect(get: '/faqs').to route_to(
      controller: 'faqs',
      action: 'index'
    )
  end
end