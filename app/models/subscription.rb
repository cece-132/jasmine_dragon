class Subscription < ApplicationRecord
  enum status: ["Active", "Inactive"]
  enum frequency: ["Once", "Monthly", "Quarterly", "Yearly"]


  validates_presence_of :title, :price, :status, :frequency

  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
