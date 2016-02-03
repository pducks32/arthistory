class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :first
      t.string :last
      t.string :title
      t.string :middle
      t.string :full
      t.string :common

      t.references :artist, index: true

      t.timestamps null: false
    end
  end
end
