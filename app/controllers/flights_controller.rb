class FlightsController < ApplicationController
  def flights
    @departure_airports = Airport.all
    @arrival_airports = Airport.all
    @dates = Flight.start_dates
    @num_passengers = (1..4)

    if request.query_parameters.present?
      @flights = Flight.search(request.query_parameters)
                       .includes(:departure_airport, :arrival_airport)
    end
  end
end
