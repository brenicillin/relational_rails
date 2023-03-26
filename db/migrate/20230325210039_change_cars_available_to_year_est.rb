class ChangeCarsAvailableToYearEst < ActiveRecord::Migration[5.2]
  def change
    rename_column :dealerships, :cars_available, :year_est
  end
end
