# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :location, optional: true
  accepts_nested_attributes_for :location
  after_save :ensure_location_id
  has_many :education_infos, dependent: :destroy
  has_many :universities, through: :education_infos
  has_many :area_joins, dependent: :destroy
  has_many :practice_areas, through: :area_joins
  belongs_to :firm_type

  validates :First_Name, presence: true
  validates :Last_Name, presence: true
  validates :Middle_Name, presence: true, allow_blank: true
  validates :Profile_Picture, presence: true, allow_blank: true
  validates :Email, presence: true, uniqueness: true
  validates :Phone_Number, presence: true, allow_blank: true
  validates :Current_Job, presence: true
  validates :firm_type_id, presence: true

  validates :Linkedin_Profile, presence: true, allow_blank: true,
                               format: { with: %r{\A(https?://(?:www\.)?linkedin\.com/.*)\z}, message: 'must be a valid LinkedIn URL or blank' }

  validates :practice_areas, presence: true
  validates :is_Admin, presence: { allow_blank: true }

  private

  def ensure_location_id
    # If the user has location attributes and no location_id, set the location_id
    update_column(:location_id, location.id) if location_id.blank? && location.present?
  end
end
