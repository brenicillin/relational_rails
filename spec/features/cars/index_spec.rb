require 'rails_helper'

RSpec.describe '/cars', type: :feature do
  before(:each) do
    dealership = Dealership.create!(name: "Test Dealership", has_stock: true, cars_available: 1)
    dealership.cars.create!(makemodel: 'Ford Fusion', mpg: 27.5, for_sale: true, cost:12000)
    require 'pry'; binding.pry
  end

  describe 'as a visitor, when I visit the car index page' do
    #User Story 3 - Child Index
    it 'displays all attributes of all cars' do

      visit '/cars'
      save_and_open_page
      expect(page).to have_content('Ford Fusion')
      expect(page).to have_content('27.5')
      expect(page).to have_content('true')
      expect(page).to have_content('12000')
    end
  end
end