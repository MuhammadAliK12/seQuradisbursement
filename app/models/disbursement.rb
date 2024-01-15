class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_and_belongs_to_many :orders

  after_save :add_monthly_fees_given, :fill_yearly_summary

  def add_monthly_fees_given
    # include a rake task to reset monthly fees to zero not part of scope

    merchant.monthly_fees_given_cents = merchant.monthly_fees_given_cents += sequra_fee_cents
    merchant.save!
  end
  
  def fill_yearly_summary
    FillYearlyDisbursementSummary.new(amount_cents, sequra_fee_cents).call
  end  
end
