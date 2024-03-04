class Location < ApplicationRecord
  has_many :users
  
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
end
