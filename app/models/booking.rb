class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :renter, foreign_key: "user_id", class_name: "User"
  has_one :owner, through: :flats

  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date }
  validates :start_date, presence: true
  validates :status, presence: true
end
