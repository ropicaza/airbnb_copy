class Flat < ApplicationRecord
  belongs_to :user


  validates :name, presence :true, uniqueness: :true
  validates :description, presence :true, length: { minimum: 50 }
  validates :price, presence :true, :numericality => { :greater_than => 0 }
  validates :location, presence :true
end
