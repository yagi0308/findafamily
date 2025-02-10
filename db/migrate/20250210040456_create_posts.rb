class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string  :title,           null: false
      t.string  :animal_image,    null: false
      t.integer :category_id,     null: false
      t.string  :animal_type,     null: false
      t.string  :age
      t.integer :gender_id,       null: false
      t.text    :personality,     null: false
      t.text    :description,     null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
