class Maker < ApplicationRecord
  has_many :bikes, dependent: :destroy
  has_many :maker_favorites, dependent: :destroy
  attachment :maker_image

   def favorited_by?(user)
    maker_favorites.where(user_id: user.id).exists?
  end

  validates :maker_name, presence: true
  validates :maker_image_id, presence: true
  validates :body, presence: true
  validates :country, presence: true

end
