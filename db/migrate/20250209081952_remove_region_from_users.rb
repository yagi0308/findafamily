class RemoveRegionFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :region, :string
  end
end
