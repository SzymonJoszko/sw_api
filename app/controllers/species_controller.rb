class SpeciesController < ApplicationController
  before_action :set_species, only: %i[ show ]

  # GET /species/1
  def show
    render json: @species
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Specie.find_object(params[:id])
    end
end
