class PracticeArea < ApplicationRecord
  has_many :users, through: :area_join
  has_many :area_joins
end
