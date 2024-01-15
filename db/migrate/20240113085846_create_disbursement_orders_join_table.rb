class CreateDisbursementOrdersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table(:disbursements, :orders, column_options: {type: :uuid})
  end
end
