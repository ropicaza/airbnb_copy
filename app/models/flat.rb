class Flat < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :location, presence: true
end
