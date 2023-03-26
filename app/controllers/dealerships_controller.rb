class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc)
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def show_cars
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end

  def new

  end

  def create
    @dealership = Dealership.new({
      name: params[:dealership][:name],
      has_stock: params[:dealership][:has_stock],
      year_est: params[:dealership][:year_est]
    })
    @dealership.save
    redirect_to '/dealerships'
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update(
      name: params[:dealership][:name],
      has_stock: params[:dealership][:has_stock],
      year_est: params[:dealership][:year_est]
    )
    dealership.save
    redirect_to "dealership/#{dealership.id}"
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end
end