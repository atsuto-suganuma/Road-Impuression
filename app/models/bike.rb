class Bike < ApplicationRecord
  has_many :bike_favorites
  has_many :years_bikes
  belongs_to :maker

  attachment :bike_image
  acts_as_taggable
  acts_as_taggable_on :tags

  enum genre: { aero: 0, allround: 1, endurance: 2 }
  enum grade: { entry: 0, middle: 1, highend: 2, flagship: 3 }



end
