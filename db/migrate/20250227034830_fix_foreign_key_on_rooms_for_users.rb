class FixForeignKeyOnRoomsForUsers < ActiveRecord::Migration[7.1]
    def change
      # 既存の外部キーを削除
      remove_foreign_key :rooms, :users
  
      # ON DELETE CASCADE を適用した外部キーを追加
      add_foreign_key :rooms, :users, on_delete: :cascade
    end
end
