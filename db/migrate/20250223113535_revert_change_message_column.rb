class RevertChangeMessageColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :messages, :message, :string
  end
end
