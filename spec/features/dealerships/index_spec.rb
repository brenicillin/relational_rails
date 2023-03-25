require "rails_helper"

RSpec.describe "/dealerships", type: :feature do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Checkered Flag Honda", has_stock: true, cars_available: 1)
    @dealership_2 = Dealership.create!(name: "Perry Ford", has_stock: false, cars_available: 0)
    @car_1 = @dealership_1.cars.create!(makemodel: "Honda Civic", mpg: 32, for_sale: true, cost: 13250)
    @car_2 = @dealership_1.cars.create!(makemodel: "Honda CRV", mpg: 22, for_sale: true, cost: 12500)
    @car_3 = @dealership_2.cars.create!(makemodel: "Ford Mustang", mpg: 21, for_sale: true, cost:18000)
  end

  describe "as a visitor, when i visit the dealership index page" do
    #User Story 1 - Parent Index
    it "shows each dealership name" do
      visit "/dealerships"
      
      expect(page).to have_content("#{@dealership_1.name}")
      expect(page).to have_content("#{@dealership_2.name}")
    end
  end

  describe "as a visitor, when i visit the dealership show page" do
    # User Story 2 - Parent Show
    it "shows the dealership information on a dealership 1" do
      visit "/dealerships/#{@dealership_1.id}"
      
      expect(page).to have_content("#{@dealership_1.name}")
      expect(page).to have_content("#{@dealership_1.has_stock}")
      expect(page).to have_content("#{@dealership_1.cars_available}")
    end

    it "shows dealership information on dealership 2" do

      visit "/dealerships/#{@dealership_2.id}"

      expect(page).to have_content("#{@dealership_2.name}")
      expect(page).to have_content("#{@dealership_2.has_stock}")
      expect(page).to have_content("#{@dealership_2.cars_available}")
    end
  end

  describe "as a visitor, when i visit the dealership cars page" do
    #User Story 5 - Parent Child Index
    it "displays the cars at a specific dealership" do

      visit "/dealerships/#{@dealership_1.id}/cars"
      save_and_open_page
      expect(page).to have_content(@car_1.makemodel)
      expect(page).to have_content(@car_1.mpg)
      expect(page).to have_content(@car_1.for_sale)
      expect(page).to have_content(@car_1.cost)
      expect(page).to have_content(@car_2.makemodel)
      expect(page).to have_content(@car_2.mpg)
      expect(page).to have_content(@car_2.for_sale)
      expect(page).to have_content(@car_2.cost)
      expect(page).to_not have_content(@car_3.makemodel)
      expect(page).to_not have_content(@car_3.mpg)
      expect(page).to_not have_content(@car_3.cost)
    end
  end
end