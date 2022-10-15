class Flight < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :arrival_airport, class_name: "Airport",
             foreign_key: :arrival_airport_id
  belongs_to :departure_airport, class_name: "Airport",
             foreign_key: :departure_airport_id

  validates :departure_airport_id, :arrival_airport_id, :start_datetime,
            :duration, presence: true

  def self.start_dates
    Flight.select(:start_datetime).distinct
          .map {|flight| flight.start_datetime.strftime("%d/%m/%Y") }
          .uniq
  end

  def self.search(search_params)
    day = DateTime.parse(search_params[:datetime], "%d/%m/%Y")
    Flight.where(
      departure_airport_id: search_params[:departure_airport],
      arrival_airport_id: search_params[:arrival_airport],
      start_datetime: (day)..(day + 1)
    )
  end
end