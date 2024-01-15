namespace :daily_disbursement do
    desc 'this rake task needs to run daily at 8 UTC'
    task make_daily_disbursement: :environment do
        DailyDisbursementJob.perform_now()
    end
  end