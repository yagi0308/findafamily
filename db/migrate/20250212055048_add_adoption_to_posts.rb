class AddAdoptionToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :adoption, :boolean
  end
end
