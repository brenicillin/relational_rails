class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :makemodel
      t.float :mpg
      t.boolean :for_sale
      t.integer :cost
      t.references :dealership, foreign_key: true

      t.timestamps
    end
  end
end
