class PerformDisbursementCalculation

    def initialize(merchant, range_of_orders)
        @merchant = merchant
        @range_of_orders = range_of_orders
    end
    
    def call
        total_fees = 0
        total_disbursed_amount = 0

        query.each do |order|
            fees, disbursed_amount = calcualate_amount_fees(order)

            total_fees += fees
            total_disbursed_amount += disbursed_amount
        end

        #Disbursement.create!(disbursement_params(total_fees, total_disbursed_amount, @merchant, query))
    end

    def query
        @merchant.orders.where(created_at: @range_of_orders .. Date.today, is_disbursed: false)
    end    

    def disbursement_params(total_fees, total_disbursed_amount, merchant, query)
        {
            amount_cents: total_disbursed_amount,
            sequra_fee_cents: total_fees,
            merchant: merchant,
            orders: query
        }
    end
    
    def calcualate_amount_fees(order)
        case order.amount_cents
        when 0 .. 4999
            get_amount_and_fees(order.amount_cents, 1)
        when 5000 .. 29999
            get_amount_and_fees(order.amount_cents, 0.95)
        else
            get_amount_and_fees(order.amount_cents, 0.85)          
        end    
    end
    
    def get_amount_and_fees(amount, commission)
       fees = amount * (commission/100)
       disbursed_amount = amount - fees
       puts "*************************************************"
       puts fees
       puts disbursed_amount
       return fees, disbursed_amount
    end    
end    