class ChangeMessageColumnToUtf8mb4 < ActiveRecord::Migration[7.1]
  def change
    change_column :messages, :message, :string, charset: 'utf8mb4'
  end
end
