class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[ show ]

  # GET /starships/1
  def show
    render json: @starship
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starship
      @starship = Starship.find_object(params[:id])
    end
end
