class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :admin
      t.integer :is_enabled
      t.string :hash

      t.timestamps
    end
  end
end
