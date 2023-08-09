class Api::V1::BusesController < ApplicationController
  before_action :bus_find, only: %i[show destroy update]

  def index
    @bus = Bus.all
    obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
    obj[:status] = :ok
    render json: obj
  end

  def show
    obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
    obj[:status] = :ok
    render json: obj
  end

  def create
    @bus = Bus.new(bus_params)
    obj = {}
    if @bus.save
      obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'Record is created successfully !'
    else
      obj[:status] = :bad_request
      obj[:message] = 'Something is not correct.'
    end
    render json: obj
  end

  def destroy
    obj = {}
    if @bus.destroy
      obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'Record is deleted successfully !'
    else
      obj[:status] = :forbidden
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  def update
    obj = {}
    if @bus.update(bus_params)
      obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'Record updated successfully'
    else
      obj[:status] = :unprocessable_entity
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  private

  def bus_params
    params.require(:bus).permit(:name, :bus_number, :capacity)
  end

  def bus_find
    @bus = Bus.find(params[:id])
  end
end
