# frozen_string_literal: true

class University < ApplicationRecord
  validates :University, presence: true, uniqueness: true
end
