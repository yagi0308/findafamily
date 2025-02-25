class AddCascadeToRoomIdInEntries < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :entries, :rooms
    add_foreign_key :entries, :rooms, on_delete: :cascade
  end
end
