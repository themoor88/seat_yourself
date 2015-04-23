class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :party_size, numericality: [only_integer: true]
  validate :date_is_valid?

  private
  def date_is_valid?
    if !date.is_a?(Date)
      errors.add(:date, 'must be a valid date')
    end
  end
end
