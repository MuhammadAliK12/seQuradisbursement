class Order < ApplicationRecord
  belongs_to :merchant
  has_and_belongs_to_many :disbursements
end
