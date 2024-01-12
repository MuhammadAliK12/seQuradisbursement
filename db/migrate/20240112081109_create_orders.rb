class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :merchant, null: false, foreign_key: true, type: :uuid
      t.monetize :amount
      t.timestamps
    end
  end
end
