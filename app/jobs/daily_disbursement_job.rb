class DailyDisbursementJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CalculateMerchantDisbursement.new(Merchant.all).call
  end
end
