class Flat < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :bookings

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :location, presence: true
end
