class Flat < ApplicationRecord
  belongs_to :owner, foreign_key: "user_id", class_name: "User"
  has_many :bookings
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :location, presence: true
end
