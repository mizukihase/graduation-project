class Production < ApplicationRecord
  has_many :user_productions
  has_many :users, through: :user_productions

  validates :external_id, presence: true, uniqueness: true
end
