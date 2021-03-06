class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :impressions, dependent: :destroy
  has_many :maker_favorites, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :bike_favorites, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image
  enum caution: { normal: 0, caution: 1, warning: 2, discipline: 3 }

    ransacker :caution, formatter: proc {|v| sym = User.cautions_i18n.invert[v]
    cautions[sym]}
end
