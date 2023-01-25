class Notification < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true
  validates :content, presence: true
end
