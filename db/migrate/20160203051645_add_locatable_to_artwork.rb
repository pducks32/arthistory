class AddLocatableToArtwork < ActiveRecord::Migration
  def change
    add_reference :artwork, :locatable, polymorphic: true, index: true
  end
end
