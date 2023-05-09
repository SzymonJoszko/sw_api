class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[ show ]

  # GET /planets/1
  def show
    render json: @planet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planet
      @planet = Planet.find_object(params[:id])
    end
end
