class StationsController < ApplicationController
  before_action :fetch_station, only: [:update, :show, :destroy]
  attr_reader :station_params, :fetch_station
  
  def index
    Station.all
  end

  def show
    render json: fetch_station
  end

  def new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      render json: @station
    end
  end

  def destroy
    @station = fetch_station
    if @station.delete
      render json: @station
    end
  end

  def update
    @station = fetch_station
    @station.update(station_params)
    if @station.save
      render json: {
        message: "Station is updated successfully", station: @station
      }
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
