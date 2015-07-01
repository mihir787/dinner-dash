class ChangeActiveColumnToInteger < ActiveRecord::Migration
  def change
    remove_column :items, :active, :boolean, default: true
    add_column :items, :active, :integer, default: 0
  end
end
