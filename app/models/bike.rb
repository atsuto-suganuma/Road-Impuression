class Bike < ApplicationRecord
  has_many :bike_favorites
  has_many :bike_images
  # has_many :years_bikes
  belongs_to :maker

  accepts_nested_attributes_for :bike_images, allow_destroy: true
  attachment :image
  # accepts_nested_attributes_for :years_bikes, allow_destroy: true
  acts_as_taggable
end
