class Impression < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  has_many :user_favorites

  validates :satisfaction_level, presence: true
  validates :design_evaluation, presence: true
  validates :weight_evaluation, presence: true
  validates :rigidity_evaluation, presence: true
  validates :comfort_evaluation, presence: true
  validates :cp_evaluation, presence: true
  validates :impression_title, presence: true
  validates :impression_text, presence: true


  def favorited_by(user)
  	favorites.where(user_id: user.id).exists?
  	
  end
end
