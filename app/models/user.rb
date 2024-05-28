class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }, format: { with: /^[0-9a-zA-Z]+$/, message: t('errors.user.name') }
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 2048 }
end
