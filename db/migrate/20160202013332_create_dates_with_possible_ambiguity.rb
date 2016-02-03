class CreateDatesWithPossibleAmbiguity < ActiveRecord::Migration
  def change
    create_table :dates_with_possible_ambiguity do |t|
      t.integer :date
      t.boolean :approximation

      t.timestamps null: false
    end
  end
end
