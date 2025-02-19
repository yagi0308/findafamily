class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_reference :rooms, :post, null: false, foreign_key: true
  end
end
