# frozen_string_literal: true

class EducationInfo < ApplicationRecord
  belongs_to :user

  belongs_to :university

  validates :Semester, presence: true
  validates :Grad_Year, presence: true, length: { minimum: 4 }
  validates :university_id, presence: true
  validates :Degree_Type, presence: true

  # if the attribute name starts with an uppercase letter like Degree_Type, it can be confused with a constant because Ruby constants also start with uppercase letters. In this case, using self helps to clarify that Degree_Type is an instance attribute, not a constant.

  def education_info_string
    "#{self.Degree_Type} from #{university.University}. #{self.Semester} #{self.Grad_Year}"
  end
end
