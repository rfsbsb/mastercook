class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
