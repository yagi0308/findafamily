class CreateAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :adoptions do |t|
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end

    remove_column :adoptions, :created_at, :datetime
    remove_column :adoptions, :updated_at, :datetime
  end
end
