class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def show_cars
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end
end