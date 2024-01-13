class CalculateMerchantDisbursement
    def initialize(merchants)
        @merchants = merchants
    end

    def call
        @merchants.includes(:orders).each do |merchant|
            if merchant.disbursement_frequency == "DAILY"
                PerformDisbursementCalculation.new(merchant, 1.day.ago).call
            elsif  merchant.disbursement_frequency == "WEEKLY"
                check_if_date_of_week_is_as_today(merchant)
            end     
        end
    end
    
    def check_if_date_of_week_is_as_today(merchant)
        if merchant.live_on.wday == Date.today.wday
               PerformDisbursementCalculation.new(merchant, 1.week.ago).call
        end    
    end
end    