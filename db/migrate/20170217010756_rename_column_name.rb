class RenameColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :weapons, :name, :model
  end
end
