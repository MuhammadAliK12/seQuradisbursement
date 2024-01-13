class AddIsDisbursedToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :is_disbursed, :boolean, default: false
  end
end
