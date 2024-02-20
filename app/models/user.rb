class User < ApplicationRecord

  has_many :area_joins, dependent: :destroy
  has_many :practice_areas, through: :area_joins

  validates :First_Name, presence: true
  validates :Last_Name, presence: true
  validates :Middle_Name, presence: true
  validates :Profile_Picture, presence: true
  validates :Email, presence: true
  validates :Phone_Number, presence: true
  validates :Current_Job, presence: true
  validates :Location, presence: true
  validates :Linkedin_Profile, presence: true
  validates :is_Admin, presence: true
end
