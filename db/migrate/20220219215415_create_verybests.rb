class CreateVerybests < ActiveRecord::Migration[6.0]
  def change
    create_table :verybests do |t|
      t.integer :dish_id
      t.integer :venue_id
      t.integer :user_id
      t.string :notes
      t.string :timestamp

      t.timestamps
    end
  end
end
