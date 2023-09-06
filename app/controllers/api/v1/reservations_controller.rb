require 'rack/utils'

class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @reservations = Reservation.all
    render json: ReservationSerializer.new(@reservations).serialized_json, status: :ok
  end

  def show
    render json: ReservationSerializer.new(set_reservation).serialized_json, status: :ok
  end

  def update
    @reservation = set_reservation
    obj = {}
    status = :ok
    if @reservation.update(route_params)
      obj = JSON.parse(ReservationSerializer.new(@reservation).serialized_json)
      obj[:message] = 'Reservation updated successfully'
      @reservation.save
    else
      obj[:invalid_requests] = @reservation.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status:
  end
  
  def destroy
    @reservation = set_reservation
    return unless @reservation.destroy

    obj = JSON.parse(ReservationSerializer.new(@route).serialized_json)
    obj[:message] = 'Reservation deleted successfully'
    render json: obj, status: :ok
  end

  def create
    @reservation = Reservation.new(route_params)
    status = :created
    obj = {}
    if @route.save
      obj = JSON.parse(ReservationSerializer.new(@reservation).serialized_json)
      obj[:message] = 'New reservation is added successfully !'
    else
      obj[:invalid_requests] = @reservation.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj, status:
  end

  private

  def set_reservation
    Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    obj = {
      data: {
        id: params[:id],
        type: 'reservation',
        attributes: {}
      },
      status: :not_found
    }
    render json: obj
  end

  def reservation_params
    params.require(:reservation).permit(:berth_number, :refund_status, :amount_paid, :status, :bus_id, :user_id)
  end
end
