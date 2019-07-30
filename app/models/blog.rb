class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :active, -> { where(public_flag: true).order(created_at: :desc) }
end
