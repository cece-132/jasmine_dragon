class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
end
