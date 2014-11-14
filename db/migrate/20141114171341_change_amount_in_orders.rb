class ChangeAmountInOrders < ActiveRecord::Migration
  def change
    change_column(:orders, :amount, :float)
  end
end
