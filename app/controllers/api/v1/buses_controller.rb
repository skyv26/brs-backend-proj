class Api::V1::BusesController < ApplicationController
  before_action :bus_find, only: %i[show destroy update]

  def index
    @buses = Bus.all
    render json: BusSerializer.new(@buses).serialized_json, status: :ok
  end

  def show
    render json: BusSerializer.new(bus_find).serialized_json, status: :ok
  end

  def create
    @bus = Bus.new(bus_params)
    status = :created
    obj = {}
    if @bus.save
      obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
      obj[:message] = 'New bus is added successfully !'
    else
      obj[:invalid_requests] = @bus.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj, status:
  end
  
  def update
    @bus = bus_find
    obj = {}
    status = :ok
    if @bus.update(bus_params)
      obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
      obj[:message] = 'Bus updated successfully'
      @bus.save
    else
      obj[:invalid_requests] = @bus.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status:
  end

  def destroy
    @bus = bus_find
    return unless @bus.destroy

    obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
    obj[:message] = 'Bus deleted successfully'
    render json: obj, status: :ok
  end
  
  private

  def bus_params
    params.require(:bus).permit(:name, :bus_number, :enquiry_number, :capacity, :agency_id, route_ids: [])
  end

  def bus_find
    Bus.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    obj = {
      data: {
        id: params[:id],
        type: 'bus',
        attributes: {}
      },
      status: :not_found
    }
    render json: obj
  end
end
