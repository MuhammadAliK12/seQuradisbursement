class CreateYearlyDisbursementsSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :yearly_disbursements_summaries, id: :uuid do |t|
      t.integer :number_of_disbursement
      t.integer :number_of_monthly_fees
      t.monetize :amount_disbursed_to_merchant
      t.monetize :amount_of_order_fees
      t.monetize :amount_of_monthly_fee_charged
      t.timestamps
    end
  end
end
