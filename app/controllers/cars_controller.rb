class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.permit(:makemodel, :mpg, :for_sale, :cost)
  end
end