class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :active, -> { where(public_flag: true).published.order(publish_at: :desc) }
  scope :published, -> { where('blogs.publish_at >= :now', now: Time.zone.now) }
end
