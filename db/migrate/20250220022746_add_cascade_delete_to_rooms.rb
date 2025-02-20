class AddCascadeDeleteToRooms < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :rooms, :posts
    add_foreign_key :rooms, :posts, on_delete: :cascade
  end
end
