class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :place, presence: true
  validates :availability, presence: true
  validates :photo, presence: true
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
end
