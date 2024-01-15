require 'rails_helper'

RSpec.describe DailyDisbursementJob, type: :job do
  include ActiveJob::TestHelper
  

  subject(:daily_disbursement_job) { described_class.perform_now(123) }

  it 'is in default queue' do
    expect(DailyDisbursementJob.new.queue_name).to eq('default')
  end

  it 'change the size of disbursements DAILY or WEEKLY, change depend on day is day matches live on then change will be greater' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant)
    merchant_weekly = create(:merchant, disbursement_frequency: "WEEKLY", live_on: "2024-01-08" )
    order_weekly = create(:order, merchant: merchant_weekly, created_at: (DateTime.now - 7.days)) #change live on day to test weekly merchant


    if merchant_weekly.live_on.wday == Date.today.wday
      expect { daily_disbursement_job }.to change(Disbursement, :count).by(2)
    else
      expect { daily_disbursement_job }.to change(Disbursement, :count).by(1)
    end
  end

  it 'should calculate correct amount of fees and disbursed amount for less then 50 (1%)' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant, amount_cents: "4000" )
    
    daily_disbursement_job
    expect(Disbursement.first.amount_cents).to eq(3960)
    expect(Disbursement.first.sequra_fee_cents).to eq(40)
  end

  it 'should calculate correct amount of fees and disbursed amount for greater then 50 and less then 300 (0.95%)' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant, amount_cents: "20000" )
    
    daily_disbursement_job
    expect(Disbursement.first.amount_cents).to eq(19810)
    expect(Disbursement.first.sequra_fee_cents).to eq(190)
  end

  it 'should calculate correct amount of fees and disbursed amount for greater then 300 (0.85%)' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant, amount_cents: "50000" )
    
    daily_disbursement_job
    expect(Disbursement.first.amount_cents).to eq(49575)
    expect(Disbursement.first.sequra_fee_cents).to eq(425)
  end

  it 'should change the total monthly fees given by merchant' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant, amount_cents: "50000" )
    
    daily_disbursement_job
    expect(Merchant.first.monthly_fees_given_cents).to eq(425)
  end

  it 'should change / add yearly disbursement summary' do

    merchant = create(:merchant)
    order =    create(:order, merchant: merchant, amount_cents: "50000" )
    expect { daily_disbursement_job }.to change(YearlyDisbursementsSummary, :count).by(1)
  end
end
