class AddYearToYearlyDisbursementsSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :yearly_disbursements_summaries, :year, :string
  end
end
