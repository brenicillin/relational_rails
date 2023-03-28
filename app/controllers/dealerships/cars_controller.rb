class Dealerships::CarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end

  def new
    @dealership = Dealership.find(params[:id])
    @car = Car.new
  end

  def create
    @dealership = Dealership.find(params[:id])
    @car = @dealership.cars.create!(car_params)
    redirect_to "/dealerships/#{params[:id]}/cars"
  end

  private
  def car_params
    params.permit(:makemodel, :mpg, :for_sale, :cost)
  end
end