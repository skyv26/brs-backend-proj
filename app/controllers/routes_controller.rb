class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :update, :destroy]

  def index
    @routes = Route.all
    render json: @routes, status: :ok
  end

  def show
    render json: @route, status: :ok
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      render json: {
        message: "Route created successfully",
      }, status: :created
    else
      render json: {
               error_message: "Route creations field",
               errors: @route.errors.full_message,
             }, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      render json: {
        route: @route,
        message: "Route updated successfully",
      }, status: :ok
    else
      render json: {
               error_message: "Route updates field",
               errors: @route.errors.full_message,
             }, status: :unprocessable_entity
    end
  end

  def destroy
    @route.destroy
    render json: {
      message: "Route deleted successfully",
    }, status: :ok
  end

  private

  def route_params
    params.require(:route).permit(:distance, :time_duration, :departure_time)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
