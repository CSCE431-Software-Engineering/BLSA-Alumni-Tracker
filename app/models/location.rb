class Location < ApplicationRecord
  has_many :users

  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true

  def location_string
    "#{city}, #{state}, #{country}"
  end
end
