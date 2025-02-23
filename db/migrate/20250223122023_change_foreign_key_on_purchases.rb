class ChangeForeignKeyOnPurchases < ActiveRecord::Migration[7.1]
  def change
    # 1. item_id を NULL 許可に変更
    change_column_null :purchases, :item_id, true

    # 2. item_id に ON DELETE SET NULL の外部キーを追加
    add_foreign_key :purchases, :items, on_delete: :nullify
  end
end
