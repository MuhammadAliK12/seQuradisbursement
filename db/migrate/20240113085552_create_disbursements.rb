class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements, id: :uuid do |t|
      t.monetize :amount
      t.monetize :sequra_fee
      t.references :merchant, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
