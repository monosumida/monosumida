class Blog < ApplicationRecord
  belongs_to :user
  has_many :blog_categories
  has_many :categories, through: :blog_categories

  validates :title, presence: true

  scope :active, -> { where(public_flag: true).order(created_at: :desc) }
end
