class CreateDisbursementOrdersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :disbursements, :orders
  end
end
