class CarsController < ApplicationController
  def index
    @cars = Car.where(for_sale: true)
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to "/cars"
  end

  private
  def car_params
    params.permit(:makemodel, :mpg, :for_sale, :cost)
  end
end