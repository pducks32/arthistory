class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :vasarian_age
      t.references :name, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
