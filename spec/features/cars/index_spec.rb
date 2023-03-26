require "rails_helper"

RSpec.describe "/cars", type: :feature do
  before(:each) do
    @dealership = Dealership.create!(name: "Test Dealership", has_stock: true, year_est: 1999)
    @car_1 = @dealership.cars.create!(makemodel: "Ford Fusion", mpg: 27.5, for_sale: true, cost:12000)
    @car_2 = @dealership.cars.create!(makemodel: "Hyundai Elantra", mpg: 26, for_sale: true, cost: 12500)
  end

  describe "as a visitor, when I visit the car index page" do
    it "displays all attributes of all cars" do

      visit "/cars"

      expect(page).to have_content("#{@car_1.makemodel}")
      expect(page).to have_content("#{@car_1.mpg}")
      expect(page).to have_content("#{@car_1.for_sale}")
      expect(page).to have_content("#{@car_1.cost}")
      expect(page).to have_content("#{@car_2.makemodel}")
      expect(page).to have_content("#{@car_2.mpg}")
      expect(page).to have_content("#{@car_2.for_sale}")
      expect(page).to have_content("#{@car_2.cost}")
    end
  end

  describe "as a visitor, when I visit the car show page" do
    it "displays the car at :id and its attributes" do

    visit "/cars/#{@car_1.id}"
    
    expect(page).to have_content("#{@car_1.makemodel}")
    expect(page).to have_content("#{@car_1.mpg}")
    expect(page).to have_content("#{@car_1.for_sale}")
    expect(page).to have_content("#{@car_1.cost}")
    expect(page).to_not have_content("#{@car_2.makemodel}")
    end
  end
end