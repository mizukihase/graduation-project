class UserProduction < ApplicationRecord
  belongs_to :user
  belongs_to :production
end
