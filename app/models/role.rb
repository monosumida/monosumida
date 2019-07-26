class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles
  accepts_nested_attributes_for :user_roles
end
