class BlogCategory < ApplicationRecord
  belongs_to :blog
  belongs_to :category
end
