class Api::V1::ServicesController < ApplicationController
  before_action :fetch_service, only: %i[update show destroy]

  def index
    service = Service.all
    render json: ServiceSerializer.new(service).serialized_json, status: :ok
  end

  def show
    render json: ServiceSerializer.new(fetch_service).serialized_json, status: :ok
  end

  def create
    @service = Service.new(service_params)
    obj = {}
    if @service.save
      obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
      obj[:status] = :created
      obj[:message] = 'New service is added successfully !'
    else
      obj[:status] = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj
  end

  def destroy
    @service = fetch_service
    obj = {}
    if @service.delete
      obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'Service is deleted successfully !'
    else
      obj[:status] = :forbidden
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  def update
    @service = fetch_service
    @service.update(service_params)
    obj = {}
    if @service.save
      obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'Service is updated successfully'
    else
      obj[:status] = :unprocessable_entity
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  private

  def fetch_service
    Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit('name', 'icon')
  end
end
