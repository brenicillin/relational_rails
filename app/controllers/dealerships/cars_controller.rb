class Dealerships::CarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end

  def new
    require 'pry'; binding.pry
    @dealership = Dealership.find(params[:id])
  end

  def create
    @dealership = Dealership.find(params[:id])
    car = dealership.cars.create!(car_params)
    redirect to "/dealerships/#{dealership.id}/cars"
  end

  private
  def car_params
    params.permit(:makemodel, :mpg, :for_sale, :cost)
  end
end