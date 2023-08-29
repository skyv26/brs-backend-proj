class Api::V1::RoutesController < ApplicationController
  before_action :set_route, only: %i[show update destroy]

  def index
    @routes = Route.all
    object = JSON.parse(RouteSerializer.new(@routes).serialized_json)
    object[:status] = :ok
    render json: object
  end

  def show
    object = JSON.parse(RouteSerializer.new(@route).serialized_json)
    object[:status] = :ok
    render json: object
  end

  def create
    @route = Route.new(route_params)
    obj = JSON.parse(RouteSerializer.new(@route).serialized_json)
    if @route.save
      obj['data']['id'] = @route.id
      obj[:status] = :created
      obj[:message] = 'New route is added successfully !'
      # render json: {
      #   message: 'Route created successfully'
      # }, status: :created
    else
      obj[:invalid_requests] = @route.errors.full_messages
      obj[:status] = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
      obj = obj.except('data')
    end
      render json: obj
      # render json: {
      #   error_message: 'Route creations field',
      #   errors: @route.errors.full_message
      # }, status: :unprocessable_entity
  end

  def update
    if @route.update(route_params)
      obj = JSON.parse(RouteSerializer.new(@route).serialized_json)
      obj[:message] = 'Route updated successfully'
      render json: obj, status: :ok
    else
      render json: {
        error_message: 'Route updates field',
        errors: @route.errors.full_message
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    render json: {
      message: 'Route deleted successfully'
    }, status: :ok
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
