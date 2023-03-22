class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.boolean :has_stock
      t.float :avg_price

      t.timestamps
    end
  end
end
