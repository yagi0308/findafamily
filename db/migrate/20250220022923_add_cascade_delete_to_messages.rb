class AddCascadeDeleteToMessages < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :messages, :rooms
    add_foreign_key :messages, :rooms, on_delete: :cascade
  end
end
