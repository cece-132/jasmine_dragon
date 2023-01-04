require 'rails_helper'

RSpec.describe SubscriptionTea, type: :model do
  describe 'validations' do
    it { should validate_presence_of :subscription_id }
    it { should validate_presence_of :tea_id }
  end

  describe 'relationships' do
    it { should belong_to :subscription}
    it { should belong_to :tea }
  end
end
