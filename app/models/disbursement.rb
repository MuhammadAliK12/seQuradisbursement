class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_and_belongs_to_many :orders

  after_create :add_monthly_fees_given

  def add_monthly_fees_given
    # include a rake task to reset monthly fees to zero not part of scope

    merchant.monthly_fees_given_cents = merchant.monthly_fees_given_cents += sequra_fee_cents
    merchant.save!
  end  
end
