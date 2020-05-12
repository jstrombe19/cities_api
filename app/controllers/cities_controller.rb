class CitiesController < ApplicationController
  before_action :find_city_by_id, only: [:show, :update, :destroy]

  def index
    @cities = City.all 
    render json: @cities
  end

  def show
    render json: @city
  end

  def create
    @city = City.create(city_params)
    render json: @city
  end

  def update
    @city.update(city_params)
    render json: @city
  end

  def destroy
    @city.destroy 
    redirect_to "index"
  end

  private

  # strong parameters are used to restrict incoming data to only those specified - all other parameters
  # will be summarily dismissed. they also provide additional security by requiring a top-level key
  # strong params syntax:
  # params.require(#{model_name}).permit(#{list each attribute for the model})

  def city_params
    params.require(:city).permit(:name, :population, :state, :crimes_per_capita)
  end

  def find_city_by_id
    @city = City.find(params[:id])
  end

end
