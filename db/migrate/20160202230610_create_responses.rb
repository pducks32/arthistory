class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.integer :response_type

      t.timestamps null: false
    end
  end
end
