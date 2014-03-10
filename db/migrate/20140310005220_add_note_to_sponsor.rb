class AddNoteToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :note, :text
  end
end
