class Relationship < ApplicationRecord
  validates :following_id, uniqueness: { scope: :followed_id }
end
