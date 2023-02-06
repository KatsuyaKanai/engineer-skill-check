class Employee < ApplicationRecord
  belongs_to :office
  belongs_to :department
  has_many :profiles
  has_many :notifications

  validates :number, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: 0 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :date_of_joining, presence: true
  validate :joining_the_future

  def joining_the_future
    return if date_of_joining.blank?

    errors.add(:date_of_joining, "は今日以降の日付は登録できません") unless
    date_of_joining < Date.today
  end

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
