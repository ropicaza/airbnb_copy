class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :flats, dependent: :destroy
  has_many :reservations, through: :flats, source: :bookings
  has_many :reviews, through: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_reviews_to_users
    reviews.where.not(user_id: id)
  end
end
