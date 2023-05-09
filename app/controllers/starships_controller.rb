class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[ show update destroy ]

  # GET /starships
  def index
    @starships = Starship.all

    render json: @starships
  end

  # GET /starships/1
  def show
    render json: @starship
  end

  # POST /starships
  def create
    @starship = Starship.new(starship_params)

    if @starship.save
      render json: @starship, status: :created, location: @starship
    else
      render json: @starship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /starships/1
  def update
    if @starship.update(starship_params)
      render json: @starship
    else
      render json: @starship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /starships/1
  def destroy
    @starship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starship
      @starship = Starship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starship_params
      params.fetch(:starship, {})
    end
end
