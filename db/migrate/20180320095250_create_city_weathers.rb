class CreateCityWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :city_weathers do |t|
      t.belongs_to 'city'

      t.float :temperature
      t.float :temperature_minimum
      t.float :temperature_maximum
      t.string :pressure_sea_level_default
      t.float :pressure_seal_level
      t.float :pressure_ground_level
      t.string :humidity
      t.float :cloudiness_percentage
      t.float :wind_speed
      t.float :wind_degree
      t.float :rain_volume
      t.float :snow_volume
      t.datetime :time_of_data_forecasted
      t.timestamps
    end
    add_index :city_weathers, [:city_id, :time_of_data_forecasted], unique: true
  end
end
