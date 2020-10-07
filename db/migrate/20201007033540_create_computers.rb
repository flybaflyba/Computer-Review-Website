class CreateComputers < ActiveRecord::Migration[6.0]
  def change
    create_table :computers do |t|
      t.string :model
      t.string :price
      t.string :cpu
      t.string :os
      t.string :disk
      t.string :ram
      t.string :screen

      t.timestamps
    end
  end
end
