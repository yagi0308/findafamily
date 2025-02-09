class AddRegionIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :region_id, :integer
  end
end
