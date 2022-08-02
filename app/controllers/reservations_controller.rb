require 'rack/utils'

class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    @reservations = Reservation.all
    render json: ReservationSerializer.new(@reservations).serialized_json
  end

  def show
    render json: ReservationSerializer.new(@reservation).serialized_json
  end

  def update
    if @reservation.update(reservation_params)
      render json: ReservationSerializer.new(@reservation).serialized_json
    else
      render json: { errors: @reservation.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: "Reservation successfully deleted!" }, status: :ok
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { message: "Reservation successfully created!"}, status: :created
    else
      render json: { errors: @reservation.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:berth_number, :refund_status, :amount_paid, :status)
  end

  def render_not_found
    render json: { error: 'Reservation not found' }, status: :not_found
  end
end
