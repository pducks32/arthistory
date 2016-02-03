class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :alternative_name
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
