require "rails_helper"

RSpec.describe "/dealerships/cars", type: :feature do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Checkered Flag Honda", has_stock: true, year_est: 1985, created_at: 3.days.ago)
    @dealership_2 = Dealership.create!(name: "Perry Ford", has_stock: false, year_est: 1954, created_at: 13.days.ago)
    @car_1 = @dealership_1.cars.create!(makemodel: "Honda Civic", mpg: 32, for_sale: true, cost: 13250)
    @car_2 = @dealership_1.cars.create!(makemodel: "Honda CRV", mpg: 22, for_sale: true, cost: 12500)
    @car_3 = @dealership_2.cars.create!(makemodel: "Ford Mustang", mpg: 21, for_sale: true, cost:18000)
  end

  describe "as a visitor, when i visit the parent children index page" do
    it "shows a link to create new car for the dealership" do
      
      visit "/dealerships/#{@dealership_1.id}/cars"

      # expect(page).to have_link("Create Car", href: "dealerships/#{@dealership_1.id}/cars/new")
      click_link "Create Car"
      expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars/new")
      
      expect(page).to have_field("makemodel")
      expect(page).to have_field("mpg")
      expect(page).to have_field("cost")
    end

    it "creates a car that belongs to the specified dealership" do
      
      visit "/dealerships/#{@dealership_1.id}/cars/new"

      fill_in "makemodel", with: "Ford Pinto"
      fill_in "mpg", with: "18"
      choose "for_sale_true"
      fill_in "cost", with: "12000"
      click_button "Create Car"

      expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
      expect(page).to have_content("Ford Pinto")
      expect(page).to have_content("12000")
      expect(page).to have_content("18")
    end
  end
end