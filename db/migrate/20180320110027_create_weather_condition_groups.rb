class CreateWeatherConditionGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_condition_groups do |t|
      t.string :name, null: false
      t.timestamps
      t.index :name, unique: true
      t.timestamps
    end
  end
end
