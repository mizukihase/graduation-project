class Production < ApplicationRecord
  def self.ransackable_associations(auth_object = nil)
    %w[user_productions users]
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[
      author
      category
      created_at
      external_id
      id
      id_value
      image_url
      title
      updated_at
    ]
  end
  has_many :user_productions
  has_many :users, through: :user_productions
  has_many :comments, dependent: :destroy
  validates :external_id, presence: true, uniqueness: true
  paginates_per 10
end
