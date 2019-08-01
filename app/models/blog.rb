class Blog < ApplicationRecord
  belongs_to :user
  has_many :blog_categories
  has_many :categories, through: :blog_categories

  accepts_nested_attributes_for :blog_categories, allow_destroy: true

  validates :title, presence: true

  scope :active, -> { where(public_flag: true).order(created_at: :desc) }
  scope :belonging_to_category, ->(name) { joins(:categories).where(categories: { name: name} ) }
end
