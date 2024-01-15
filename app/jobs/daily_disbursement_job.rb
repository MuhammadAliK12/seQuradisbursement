class DailyDisbursementJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CalculateMerchantDisbursement.new(Merchant.all).call
  rescue StandardError => e
    logger.error e.message
    logger.error e.backtrace.join("\n") 
  end
end
