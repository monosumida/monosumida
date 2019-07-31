class Category < ApplicationRecord
  has_many :blog_categories, dependent: :destroy
  has_many :blogs, through: :blog_categories
end
