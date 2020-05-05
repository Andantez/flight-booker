# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = Booking.new(flight_id: @flight.id)
    @passengers = []
    passengers = params[:passengers].to_i
    passengers.times do
      @passengers << Passenger.new
    end
  end

  def create
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = @flight.bookings.new(booking_params)
    @booking.passengers.each { |passenger| passenger.flight_id = @flight.id }
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger)
                       .thank_you_email.deliver_now
      end
      flash[:nocite] = 'Your flight was booked successfully'
      redirect_to @booking
    else
      flash.now[:danger] = 'Something went wrong, sorry'
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit!
  end
end
