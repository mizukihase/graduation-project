class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :user_productions
  has_many :productions, through: :user_productions
  has_many :comments

  accepts_nested_attributes_for :user_genres, allow_destroy: true
end
