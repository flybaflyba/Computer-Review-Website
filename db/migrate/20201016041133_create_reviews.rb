class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :score
      t.integer :computer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
