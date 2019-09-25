class YearsBike < ApplicationRecord
  belongs_to :bike
  has_many :years_bike_images, dependent: :destroy
  accepts_nested_attributes_for :years_bike_images, allow_destroy: true

  validates :year, presence: true
  validates :year_bike_body, presence: true

end
