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
    status = :created
    if @service.save
      obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
      obj[:message] = 'New service is added successfully !'
    else
      obj[:invalid_requests] = @service.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj, status: status
  end

  def destroy
    @service = fetch_service
    if @service.delete
      render json: { message: 'Service is deleted successfully' }, status: :ok
    else
      render json: { message: 'Service is not deleted' }, status: :unprocessable_entity
    end
  end

  def update
    @service = fetch_service
    obj = {}
    status = :ok
    if @service.update(service_params)
      obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
      obj[:message] = 'Service updated successfully'
      @service.save
    else
      obj[:invalid_requests] = @service.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status:
  end

  private

  def fetch_service
    Service.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    obj = {
      data: {
        id: params[:id],
        type: 'service',
        attributes: {}
      }
    }
    render json: obj, status: :not_found
  end

  def service_params
    params.require(:service).permit('name', 'icon')
  end
end
