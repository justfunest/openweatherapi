class CreateWeatherConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_conditions do |t|
      t.belongs_to 'weather_condition_group'
      t.text :description
      t.text :icon
      t.timestamps
    end
  end
end
