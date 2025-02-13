class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string       :name,                null: false
      t.text         :description,         null: false
      t.integer      :price,               null: false
      t.integer      :item_category_id,    null: false
      t.integer      :shipping_fee_id,     null: false
      t.integer      :shipping_days_id,    null: false
      t.string       :item_image,          null: false
      t.references   :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
