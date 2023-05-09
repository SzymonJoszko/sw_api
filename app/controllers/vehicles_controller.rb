class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show ]

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find_object(params[:id])
    end
end
