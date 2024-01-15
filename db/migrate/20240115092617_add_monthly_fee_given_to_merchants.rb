class AddMonthlyFeeGivenToMerchants < ActiveRecord::Migration[7.0]
  def change
    add_monetize :merchants, :monthly_fees_given, default: 0
  end
end
