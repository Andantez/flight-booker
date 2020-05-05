# frozen_string_literal: true

# Getting the param hash and find the flight requested by the user
class FlightsController < ApplicationController
  def index
    @upcomming_flights = Flight.all.upcomming_flights
                               .paginate(page: params[:page], per_page: 3)
    @departing = params[:departing_flight_id]
    @arriving = params[:arriving_flight_id]
    if params[:datetime]
      @date = DateTime.strptime(params[:datetime], '%Y-%m-%d ')
      @datetime = (@date.beginning_of_day..@date.end_of_day)
    end
    @passengers = params[:passengers]
    @flight_result = Flight.where(departing_flight_id: @departing,
                                  arriving_flight_id: @arriving,
                                  datetime: @datetime)
  end

  private

  def flight_params
    params.require(:flight).permit(:departing_flight_id, :arriving_flight_id,
                                   :duration, :datetime, :passengers)
  end
end
