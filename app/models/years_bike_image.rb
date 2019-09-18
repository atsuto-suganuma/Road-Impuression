class YearsBikeImage < ApplicationRecord
  belongs_to :years_bike
  attachment :image

  validates :display_order, presence: true
  validates :image, presence: true
end
