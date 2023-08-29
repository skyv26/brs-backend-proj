class Api::V1::RoutesController < ApplicationController
  before_action :set_route, only: %i[show update destroy]

  def index
    @routes = Route.all
    render json: RouteSerializer.new(@routes).serialized_json, status: :ok
  end

  def show
    render json: RouteSerializer.new(set_route).serialized_json, status: :pk
  end

  def create
    @route = Route.new(route_params)
    status = :created
    obj = {}
    if @route.save
      obj = JSON.parse(RouteSerializer.new(@route).serialized_json)
      obj[:message] = 'New route is added successfully !'
    else
      obj[:invalid_requests] = @route.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
      render json: obj, status: status
  end

  def update
    @route = set_route
    obj = {}
    status = :ok
    if @route.update(route_params)
      obj = JSON.parse(RouteSerializer.new(@route).serialized_json)
      obj[:message] = 'Route updated successfully'
      @route.save
    else
      obj[:invalid_requests] = @route.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status: status
  end

  def destroy
    @route = set_route
    if @route.destroy
      obj = JSON.parse(RouteSerializer.new(@route).serialized_json)
      obj[:message] = 'Route deleted successfully'
      render json: obj, status: :ok
    end
  end

  private

  def route_params
    params.require(:route).permit(:distance, :time_duration, :departure_time, :start_station_id, :destination_station_id)
  end

  def set_route
    begin
      Route.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      obj = { 
        data: {
          id: params[:id],
          type: "route",
          attributes: {}
        },
        status: :not_found,
      }
      render json: obj
    end
  end
end
