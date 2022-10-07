class Booking < ApplicationRecord
  validate :date_cannot_be_in_the_past
  belongs_to :cocktail
  belongs_to :user

  def date_cannot_be_in_the_past
    if date <= Date.today
      errors.add(:date, "has to be from tomorrow")
    end
  end
end
