# frozen_string_literal: true

class AreaJoin < ApplicationRecord
  belongs_to :user
  belongs_to :practice_area
end
