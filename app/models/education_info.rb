# frozen_string_literal: true

class EducationInfo < ApplicationRecord
  belongs_to :user

  belongs_to :university

  validates :Semester, presence: true
  validates :Grad_Year, presence: true, length: { minimum: 4 }
  validates :university_id, presence: true
  validates :Degree_Type, presence: true
end
