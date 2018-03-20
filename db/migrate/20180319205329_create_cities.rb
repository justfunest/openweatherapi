class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.text :name, unique: true
      t.float :latitude
      t.float :longitude
      t.text :iso_code_alpha_2
      t.integer :population
      t.timestamps
    end
  end
end
