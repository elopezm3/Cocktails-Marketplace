class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :cocktails, dependent: :destroy
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
