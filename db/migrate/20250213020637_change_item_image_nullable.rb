class ChangeItemImageNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items, :item_image, true
  end
end
