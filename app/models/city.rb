class City < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :iso_code_alpha_2, presence: true
end
