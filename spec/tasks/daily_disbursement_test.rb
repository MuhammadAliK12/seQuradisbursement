require 'test_helper'
require 'rake'

class DailyDisbursementTest < ActiveSupport::TestCase

  describe 'daily_disbursement:make_daily_disbursement' do

    def setup
      SEQURADISBURSEMENT::Application.load_tasks if Rake::Task.tasks.empty?
      Rake::Task["daily_disbursement:make_daily_disbursement"].invoke
    end
  end
end