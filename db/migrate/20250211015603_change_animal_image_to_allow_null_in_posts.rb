class ChangeAnimalImageToAllowNullInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :animal_image, true
  end
end
