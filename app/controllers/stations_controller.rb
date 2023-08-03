class StationsController < ApplicationController
  before_action :fetch_station, only: %i[update show destroy]
  attr_reader :station_params, :fetch_station

  def index
    @station = Station.all
    render json: StationSerializer.new(@station).serialized_json, status: :ok
  end

  def show
    @station = Station.all
    render json: StationSerializer.new(@station).serialized_json, status: :ok
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      render json: {
        message: 'Station is created successfully'
      }, status: :created
    else
      render json: {
        message: 'Station is not created'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @station = fetch_station
    if @station.delete
      render json: { message: 'Station is deleted successfully' }, status: :ok
    else
      render json: { message: 'Station is not deleted' }, status: :unprocessable_entity
    end
  end

  def update
    @station = fetch_station
    @station.update(station_params)

    if @station.save
      obj = JSON.parse(StationSerializer.new(@station).serialized_json)
      obj[:message] = 'Route updated successfully'
      render json: obj, status: :ok
    else
      render json: {
        message: 'Station is not updated', station: @station
      }, status: :unprocessable_entity
    end
  end

  private

  def fetch_station
    Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit('name', 'city', 'state')
  end
end
