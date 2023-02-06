class Profile < ApplicationRecord
  belongs_to :employee

  validates :profile, presence: true, length: { maximum: 300 }

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
