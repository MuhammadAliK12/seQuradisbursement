class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_and_belongs_to_many :orders
end
