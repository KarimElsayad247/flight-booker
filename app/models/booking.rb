class Booking < ApplicationRecord
  belongs_to :flight
  has_and_belongs_to_many :passengers

  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
end
