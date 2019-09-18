class Bike < ApplicationRecord
  has_many :bike_favorites
  has_many :years_bikes, dependent: :destroy
  has_many :impressions, dependent: :destroy
  belongs_to :maker

  attachment :bike_image
  acts_as_taggable
  acts_as_taggable_on :tags

  enum genre: { aero: 0, allround: 1, endurance: 2 }
  enum grade: { entry: 0, middle: 1, highend: 2, flagship: 3 }

  ransacker :genre, formatter: proc {|v| sym = Bike.genres_i18n.invert[v]
    genres[sym]}
  ransacker :grade, formatter: proc {|v| sym = Bike.grades_i18n.invert[v]
    grades[sym]}

validates :bike_name, presence: true
validates :bike_name_kana, presence: true
validates :bike_image, presence: true
validates :genre, presence: true
validates :grade, presence: true

end
