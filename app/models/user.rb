class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :image, UserImageUploader

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :blogs, dependent: :destroy

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true
  validates :email, uniqueness: true

  scope :administrators, -> { joins(:roles).where(roles: { name: 'admin' }).order(id: :asc) }

  def admin?
    roles.pluck(:name).include?('admin')
  end
end
