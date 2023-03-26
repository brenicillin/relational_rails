require "rails_helper"

RSpec.describe "/dealerships", type: :feature do
  before(:each) do
    @dealership_1 = Dealership.create!(name: "Checkered Flag Honda", has_stock: true, year_est: 1985, created_at: 3.days.ago)
    @dealership_2 = Dealership.create!(name: "Perry Ford", has_stock: false, year_est: 1954, created_at: 13.days.ago)
    @car_1 = @dealership_1.cars.create!(makemodel: "Honda Civic", mpg: 32, for_sale: true, cost: 13250)
    @car_2 = @dealership_1.cars.create!(makemodel: "Honda CRV", mpg: 22, for_sale: true, cost: 12500)
    @car_3 = @dealership_2.cars.create!(makemodel: "Ford Mustang", mpg: 21, for_sale: true, cost:18000)
  end

  describe "as a visitor, when i visit the dealership index page" do
    it "shows each dealership name" do
      visit "/dealerships"
      expect(page).to have_content("#{@dealership_1.name}")
      expect(page).to have_content("#{@dealership_2.name}")
    end
  end

  describe "as a visitor, when i visit the dealership show page" do
     it "shows the dealership information on a dealership 1" do
      visit "/dealerships/#{@dealership_1.id}"
      
      expect(page).to have_content("#{@dealership_1.name}")
      expect(page).to have_content("#{@dealership_1.has_stock}")
      expect(page).to have_content("#{@dealership_1.year_est}")
    end

    it "shows dealership information on dealership 2" do

      visit "/dealerships/#{@dealership_2.id}"

      expect(page).to have_content("#{@dealership_2.name}")
      expect(page).to have_content("#{@dealership_2.has_stock}")
      expect(page).to have_content("#{@dealership_2.year_est}")
    end
  end

  describe "as a visitor, when i visit the dealership cars page" do
    it "displays the cars at a specific dealership" do

      visit "/dealerships/#{@dealership_1.id}/cars"
      
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

  describe 'as a visitor, when i visit dealership index' do
    it 'can create a new dealership' do
      visit "/dealerships"
      expect(page).to_not have_content("Toyota Carlsbad")
      click_link "Create Dealership"

      expect(current_path).to eq("/dealerships/new")
      expect(page).to have_field("dealership[name]")
      expect(page).to have_field("dealership[has_stock]")
      expect(page).to have_field("dealership[year_est]")

      fill_in "dealership[name]", with: "Toyota Carlsbad"
      choose "true"
      fill_in "dealership[year_est]", with: "1945"
      click_button "submit"
      
      expect(current_path).to eq("/dealerships")
      expect(page).to have_content("Toyota Carlsbad")
    end

    it 'can edit an existing dealership' do
      visit "/dealerships/#{@dealership_1.id}"
      click_link "Edit"

      expect(current_path).to eq("/dealerships/#{@dealership_1.id}/edit")
      expect(page).to have_field("dealership[name]")
      expect(page).to have_field("dealership[has_stock]")
      expect(page).to have_field("dealership[year_est]")

      fill_in "dealership[name]", with: "Riverview Honda"
      choose "true"
      fill_in "dealership[year_est]", with: "1994"
      click_button "submit"

      expect(current_path).to eq("/dealerships/#{@dealership_1.id}")
      expect(page).to have_content("Riverview Honda")
      expect(page).to have_content("1994")
      expect(page).to_not have_content("Checkered Flag Honda")
      expect(page).to_not have_content("1985")
    end
  end
end