class BusesController < ApplicationController
    attr_reader :bus_find, :bus_params
    before_action :bus_find, only: [:show, :destroy, :update] 

    def index
        @bus=Bus.all
        render json: BusSerializer.new(@bus).serialized_json , status: 200
    end

    def show
        render json: BusSerializer.new(@bus).serialized_json, status: 200
    end

    def create
        @bus = Bus.new(bus_params)
        if @bus.save
            render json: {message: "Record created successfully" , status: 201 }
        else
            render json: @bus.errors, status: 500 
        end
    end

    def destroy
        if @bus.destroy
            render json: { message: "Deleted successfully", status: :ok } 
        end
    end

    def update
        if @bus.update(bus_params)
            obj = JSON.parse(BusSerializer.new(@bus).serialized_json)
            obj[:message] = "Record updated successfully"
            render json: obj, status: :ok    
        else
            render json: @bus.errors.full_message, status: :unprocessable_entity 
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
