class CreateArtwork < ActiveRecord::Migration
  def change
    create_table :artwork do |t|
      t.string :name
      t.references :artist, index: true, foreign_key: true
      t.string :medium
      t.string :image_url

      t.timestamps null: false
    end
  end
end
