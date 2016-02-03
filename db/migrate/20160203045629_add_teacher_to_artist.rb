class AddTeacherToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :teacher_id, :integer
  end
end
