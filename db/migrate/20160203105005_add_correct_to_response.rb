class AddCorrectToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :correct, :boolean
  end
end
