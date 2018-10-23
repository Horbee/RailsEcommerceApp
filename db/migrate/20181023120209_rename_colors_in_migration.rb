class RenameColorsInMigration < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :color, :colour
  end
end