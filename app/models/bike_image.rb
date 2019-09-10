class BikeImage < ApplicationRecord
  belongs_to :bike
  attachment :image
end
