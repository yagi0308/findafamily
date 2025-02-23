class ChangeForeignKeyOnPurchases < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :purchases, :items, name: "fk_rails_e2f5de52a5"
    add_foreign_key :purchases, :items, on_delete: :cascade
  end
end
