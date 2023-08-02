class ServicesController < ApplicationController
    attr_reader :service_params, :fetch_service
    before_action :fetch_service, only: [:update, :show, :destroy]

    def index
        service = Service.all
        obj = JSON.parse(ServiceSerializer.new(service).serialized_json)
        obj[:status] = :ok
        render json: obj
    end
    
    def show
        obj = JSON.parse(ServiceSerializer.new(fetch_service).serialized_json)
        obj[:status] = :ok
        render json: obj
    end

    def create
        @service = Service.new(service_params)
        obj = {}
        if @service.save
            obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
            obj[:status] = :created
            obj[:message] = "New service is added successfully !"
            render json: obj
        else
            obj[:status] = :bad_request
            obj[:message] = "Oops! Something is not correct."
            render json: obj
        end
    end

    def destroy
        @service = fetch_service
        obj = {}
        if @service.delete
            obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
            obj[:status] = :ok
            obj[:message] = "Service is deleted successfully !"
            render json: obj
        else
            obj[:status] = :forbidden
            obj[:message] = "Please make sure that your ID is correct"
            render json: obj
        end
    end

    def update
        @service = fetch_service
        @service.update(service_params)
        obj = {}
        if @service.save
            obj = JSON.parse(ServiceSerializer.new(@service).serialized_json)
            obj[:status] = :ok
            obj[:message] = "Service is updated successfully"
            render json: obj
        else
            obj[:status] = :unprocessable_entity
            obj[:message] = "Please make sure that your ID is correct"
            render json: obj
        end
    end

    private

    def fetch_service
        Service.find(params[:id])
    end

    def service_params
        params.require(:service).permit('name', 'icon')
    end
end
