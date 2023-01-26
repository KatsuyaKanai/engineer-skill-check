class Notification < ApplicationRecord
  belongs_to :employee

  validates :title, length: { minimum: 1, maximum: 50 }
  validates :content, presence: true
end
