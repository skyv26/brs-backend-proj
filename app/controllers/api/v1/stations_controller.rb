class Api::V1::StationsController < ApplicationController
  before_action :fetch_station, only: %i[update show destroy]

  def show
    render json: StationSerializer.new(@station).serialized_json, status: :ok
  end

  def index
    @station = Station.all
    render json: StationSerializer.new(@station).serialized_json, status: :ok
  end

  def create
    @station = Station.new(station_params)
    obj = {}
    status = :created
    if @station.save
      obj = JSON.parse(StationSerializer.new(@station).serialized_json)
      obj[:message] = 'New Station is added successfully !' 
    else
      obj[:invalid_requests] = @station.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj, status: status
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
    obj = {}
    status = :ok
    if @station.update(station_params)
      obj = JSON.parse(StationSerializer.new(@station).serialized_json)
      obj[:message] = 'Station updated successfully'
      @station.save
    else
      obj[:invalid_requests] = @station.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status: status
  end

  private

  def fetch_station
    begin
      Station.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      obj = { 
        data: {
          id: params[:id],
          type: "station",
          attributes: {}
        }
      }
      render json: obj, status: :not_found
    end
  end

  def station_params
    params.require(:station).permit('name','city', 'state')
  end
  
end
