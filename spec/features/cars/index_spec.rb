require "rails_helper"

RSpec.describe "/cars", type: :feature do
  before(:each) do
    @dealership = Dealership.create!(name: "Test Dealership", has_stock: true, year_est: 1999)
    @car_1 = @dealership.cars.create!(makemodel: "Ford Fusion", mpg: 27.5, for_sale: true, cost:12000)
    @car_2 = @dealership.cars.create!(makemodel: "Hyundai Elantra", mpg: 26, for_sale: true, cost: 12500)
    @car_3 = @dealership.cars.create!(makemodel: "Geo Metro", mpg: 13, for_sale: false, cost: 3600)
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

  describe "as a visitor, when I visit a child show page" do
    it 'sees a link to update that child' do
      visit "/cars/#{@car_1.id}"

      expect(page).to have_link "Update Car"
      click_link "Update Car"
      expect(current_path).to eq("/cars/#{@car_1.id}/edit")
      expect(page).to have_field("makemodel")
      expect(page).to have_field("mpg")
      expect(page).to have_field("cost")
    end

    it 'properly updates information and redirects to show page' do
      
      visit "/cars/#{@car_1.id}"
      click_link "Update Car"

      fill_in "makemodel", with: "Ford Fiesta"
      fill_in "mpg", with: "29"
      choose "for_sale_true"
      fill_in "cost", with: "14000"
      click_button "Update Car"

      expect(current_path).to eq("/cars/#{@car_1.id}")
      expect(page).to have_content("Ford Fiesta")
      expect(page).to have_content("29")
      expect(page).to have_content("14000")
      expect(page).to_not have_content("Ford Fusion")
      expect(page).to_not have_content("27.5")
      expect(page).to_not have_content("12000")
    end
  end

  describe "as a visitor" do
    it "child index only shows true records" do
      visit "/cars"

      expect(page).to have_content("Ford Fusion")
      expect(page).to have_content("Hyundai Elantra")
      expect(page).to_not have_content("Geo Metro")
    end
  end
end