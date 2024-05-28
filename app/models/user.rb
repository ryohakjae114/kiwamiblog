class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }, format: { with: /^[0-9a-zA-Z]+$/, multiline: true, message: I18n.t('errors.user.name') }
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 2048 }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
