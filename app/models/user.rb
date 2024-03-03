# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :location, optional: true
  accepts_nested_attributes_for :location
  after_save :ensure_location_id

  validates :First_Name, presence: true
  validates :Last_Name, presence: true
  validates :Middle_Name, presence: true
  validates :Profile_Picture, presence: true
  validates :Email, presence: true
  validates :Phone_Number, presence: true
  validates :Current_Job, presence: true
  # validates :Location, presence: true
  #for geocoder gem (location attribute)
  # def set_location_by_ip(ip_address)
  #   results = Geocoder.search(ip_address)
  #   if results.present?
  #     self.location = results.first.city
  #   end
  # end
  validates :Linkedin_Profile, presence: true
  validates :is_Admin, presence: { allow_blank: true }

  private

  def ensure_location_id
    # If the user has location attributes and no location_id, set the location_id
    if self.location_id.blank? && self.location.present?
      self.update_column(:location_id, self.location.id)
    end
  end

end
