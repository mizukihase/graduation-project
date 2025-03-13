class Genre < ApplicationRecord
  belongs_to :category
  has_many :user_genres
  has_many :users, through: :user_genres

  validates :name, presence: true, uniqueness: { scope: :category_id }
  validates :category_id, presence: true
end
