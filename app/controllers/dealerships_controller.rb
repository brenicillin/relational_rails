class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def show
    require 'pry'; binding.pry
    @dealership = Dealership.find(params[:id])
  end
end