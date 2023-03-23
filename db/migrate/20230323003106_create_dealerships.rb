class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.boolean :has_stock
      t.integer :cars_available
      t.timestamps
    end
  end
end
