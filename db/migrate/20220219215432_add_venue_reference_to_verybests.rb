class AddVenueReferenceToVerybests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :verybests, :venues
    add_index :verybests, :venue_id
    change_column_null :verybests, :venue_id, false
  end
end
