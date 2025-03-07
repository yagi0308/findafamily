class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
