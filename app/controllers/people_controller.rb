class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show ]

  # GET /people
  def index
    @people = Person.all_objects

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find_object(params[:id])
    end
end
