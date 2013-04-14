class CreateSharedNotes < ActiveRecord::Migration
  def change
    create_table :shared_notes do |t|
      t.references :note
      t.references :user

      t.timestamps
    end
    add_index :shared_notes, :note_id
    add_index :shared_notes, :user_id
  end
end
