class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: { bookings: @bookings}
  end

  def show
    @booking = Booking.find(params[:id])
    render json: { booking: @booking}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: { booking: @booking}
    else
      render json: { error: "Booking was not created."}
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      render json: { booking: @booking}
    else
      render json: { error: "Booking was not updated."}
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      render json: { booking: nil}
    else
      render json: { error: "Booking was not deleted."}
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:listing_id, :reservation_id, :mission_id, :date, :price)
  end
end
