class Maker < ApplicationRecord
  has_many :bikes, dependent: :destroy
  attachment :maker_image

  validates :maker_name, presence: true
  validates :maker_image_id, presence: true
  validates :body, presence: true
  validates :country, presence: true

end
