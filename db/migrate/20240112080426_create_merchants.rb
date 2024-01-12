class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants, id: :uuid do |t|
      t.string :email
      t.date :live_on
      t.string :disbursement_frequency
      t.monetize :minimum_monthly_fees
      t.timestamps
    end
  end
end
