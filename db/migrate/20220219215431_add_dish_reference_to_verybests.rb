class AddDishReferenceToVerybests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :verybests, :dishes
    add_index :verybests, :dish_id
    change_column_null :verybests, :dish_id, false
  end
end
