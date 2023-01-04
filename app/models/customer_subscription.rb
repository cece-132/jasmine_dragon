class CustomerSubscription < ApplicationRecord
  enum status: ["Active", "Cancelled"]

  belongs_to :customer
  belongs_to :subscription

  validates_presence_of :customer_id, :subscription_id
end
