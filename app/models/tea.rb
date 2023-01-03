class Tea < ApplicationRecord
  validates_presence_of :title, :desciption, :temperature, :brew_time

end