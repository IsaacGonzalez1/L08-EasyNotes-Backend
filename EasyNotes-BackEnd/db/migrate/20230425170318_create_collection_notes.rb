class CreateCollectionNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_notes, id: false do |t|
      t.integer :id_collection, null: false
      t.integer :id_note, null: false

      t.timestamps
    end
  end
end
