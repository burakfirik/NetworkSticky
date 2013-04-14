class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :description
      t.references :note

      t.timestamps
    end
    add_index :contents, :note_id
  end
end
