# frozen_string_literal: true

class User < ApplicationRecord
  validates :First_Name, presence: true
  validates :Last_Name, presence: true
  validates :Middle_Name, presence: true
  validates :Profile_Picture, presence: true
  validates :Email, presence: true
  validates :Phone_Number, presence: true
  validates :Current_Job, presence: true
  validates :Location, presence: true
  # #for geocoder gem (location attribute)
  # def set_location_by_ip(ip_address)
  #   results = Geocoder.search(ip_address)
  #   if results.present?
  #     self.location = results.first.city
  #   end
  # end
  validates :Linkedin_Profile, presence: true
  validates :is_Admin, presence: { allow_blank: true }
end
