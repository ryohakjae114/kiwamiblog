class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\z/, multiline: true, message: I18n.t('errors.user.name') },
                   uniqueness: true
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 2048 }

  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy, inverse_of: :following
  has_many :followings, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :followers, through: :passive_relationships, source: :followed

  def follow?(user)
    active_relationships.exists?(followed_id: user.id)
  end

  def follow!(user)
    active_relationships.create!(followed_id: user.id) unless self == user
  end

  def unfollow!(user)
    active_relationships.find_by(followed_id: user.id).destroy!
  end

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
