class AddArtworkToQuestion < ActiveRecord::Migration
  def change
    add_reference :artwork, :question, index: true, foreign_key: true
  end
end
