class AddAnswerToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :answer, :string
  end
end
