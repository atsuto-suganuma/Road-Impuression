class Maker < ApplicationRecord
  has_many :bikes, dependent: :destroy
  attachment :maker_image
end
