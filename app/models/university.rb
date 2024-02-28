# frozen_string_literal: true

class University < ApplicationRecord
  has_many :education_info

  validates :University, presence: true, uniqueness: true
end
