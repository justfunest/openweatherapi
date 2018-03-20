class CreateCityWeatherConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :city_weather_conditions do |t|
      t.belongs_to 'city_weather'
      t.belongs_to 'weather_condition'
      t.timestamps
    end
  end
end
