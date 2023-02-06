class Notification < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
