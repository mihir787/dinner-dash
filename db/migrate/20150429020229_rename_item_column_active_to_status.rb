class RenameItemColumnActiveToStatus < ActiveRecord::Migration
  def change
    rename_column :items, :active, :status
  end
end
