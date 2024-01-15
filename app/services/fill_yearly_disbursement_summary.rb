class FillYearlyDisbursementSummary
    def initialize(amount, fees)
        @amount = amount
        @fees = fees
    end

    def call
        summary = YearlyDisbursementsSummary.find_or_create_by(year: Time.now.year.to_s)
        summary.update!(yearly_summary_params(summary))
    end

    def yearly_summary_params(summary)
        {
            number_of_disbursement: summary.number_of_disbursement ? summary.number_of_disbursement += 1 : 1,
            number_of_monthly_fees: summary.number_of_monthly_fees ? summary.number_of_monthly_fees += 1 : 1,
            amount_disbursed_to_merchant_cents: summary.amount_disbursed_to_merchant_cents ? summary.amount_disbursed_to_merchant_cents += @amount : @amount,
            amount_of_order_fees_cents: summary.amount_of_order_fees_cents ? summary.amount_of_order_fees_cents += @fees : @fees,
            amount_of_monthly_fee_charged_cents: summary.amount_of_monthly_fee_charged_cents ? summary.amount_of_monthly_fee_charged_cents += 1000 : 1000
        } #number_of_monthly_fees, amount_of_monthly_fee_charged is not currently calcualted in yearly summary due to lack of time and function out of scope
    end
end    