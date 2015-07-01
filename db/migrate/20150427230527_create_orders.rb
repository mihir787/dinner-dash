class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :status
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
