class ChangeActiveColumnItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :active, :boolean, default: true
    end
  end
end
