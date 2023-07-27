class ServicesController < ApplicationController
    attr_reader :service_params, :fetch_service
    before_action :fetch_service, only: [:update, :show, :destroy]

    def index
        Service.all
    end
    
    def show
        render json: fetch_service
    end

    def new
        Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            render json: @service
        end
    end

    def destroy
        @service = fetch_service
        if @service.delete
            render json: @service
        end
    end

    def update
        @service = fetch_service
        @service.update(service_params)
        if @service.save
            render json: {
                message: "Service is updated successfully", service: @service
            }
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
