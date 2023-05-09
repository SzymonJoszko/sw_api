class FilmsController < ApplicationController
  before_action :set_film, only: %i[ show ]

  # GET /films
  def index
    @films = Film.all_objects

    render json: @films
  end

  # GET /films/1
  def show
    render json: @film
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find_object(params[:id])
    end
end
