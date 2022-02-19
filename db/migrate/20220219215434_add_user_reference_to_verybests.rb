class AddUserReferenceToVerybests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :verybests, :users
    add_index :verybests, :user_id
    change_column_null :verybests, :user_id, false
  end
end
