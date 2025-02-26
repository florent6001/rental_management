class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: { reservations: @reservations}
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: { reservation: @reservation}
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { reservation: @reservation}
    else
      render json: { error: "Reservation was not created."}
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      render json: { reservation: @reservation}
    else
      render json: { error: "Reservation was not updated."}
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { reservation: nil }
    else
      render json: { error: "Reservation was not deleted."}
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:listing_id, :mission_id, :date, :price)
  end
end
