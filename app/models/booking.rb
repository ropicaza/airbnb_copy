class Booking < ApplicationRecord
  belongs_to :renter, foreign_key: "user_id", class_name: "User"
  belongs_to :flat


  #validates :start_date, presence: true
  #validates :end_date, presence: true
  #validates :status, presence: true
end
