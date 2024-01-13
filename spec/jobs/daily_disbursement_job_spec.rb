require 'rails_helper'

RSpec.describe DailyDisbursementJob, type: :job do
  include ActiveJob::TestHelper

  subject(:daily_disbursement_job) { described_class.perform_now(123) }

  it 'is in default queue' do
    expect(DailyDisbursementJob.new.queue_name).to eq('default')
  end

  it 'change the size of disbursements' do
    expect { daily_disbursement_job }.to change(Disbursement, :count).by(1)
  end  
end
