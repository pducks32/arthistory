class CreateTestConfigurations < ActiveRecord::Migration
  def change
    create_table :test_configurations do |t|
      t.integer :name_style
      t.integer :artist_style
      t.integer :year_style
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
