class BusesController < ApplicationController
    attr_reader :bus_find, :bus_params
    before_action :bus_find, only: [:show, :destroy, :update] 

    def index
        @bus=Bus.all
        obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
        obj[:status] = :ok
        render json: obj
    end

    def show
        obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
        obj[:status] = :ok
        render json: obj
    end

    def create
        @bus = Bus.new(bus_params)
        if @bus.save
            obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
            obj[:status] = :ok
            obj[:message]="Record is created successfully !"
            render json: obj
        else
            obj[:status] = :bad_request
            obj[:message] = "Something is not correct."
            render json: obj
        end
    end

    def destroy
        if @bus.destroy
            obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
            obj[:status] = :ok
            obj[:message] = "Record is deleted successfully !"
            render json: obj
        else
            obj[:status] = :forbidden
            obj[:message] = "Please make sure that your ID is correct"
            render json: obj
        end
    end

    def update
        if @bus.update(bus_params)
            obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
            obj[:status] = :ok
            obj[:message] = "Record updated successfully"
            render json: obj
        else
            obj[:status] = :unprocessable_entity
            obj[:message] = "Please make sure that your ID is correct"
            render json: obj  
        end
    end

    private

    def bus_params
        params.require(:bus).permit(:name,:bus_number,:capacity)
    end

    def bus_find
        @bus = Bus.find(params[:id])
    end

end
