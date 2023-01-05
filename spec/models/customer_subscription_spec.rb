require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :subscription_id }
    it { should validate_presence_of :status }
    it { should define_enum_for(:status).with_values(["Active", "Cancelled"]) }

  end

  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :subscription}
  end

  describe 'Instance Methods' do
    describe '#all_subscriptions(customer_id)' do
      it 'should return all the subscriptions belonging to a customer' do
        cus1 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
        sub1 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: "Active", frequency: "Monthly")
        sub2 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: "Active", frequency: "Monthly")
        tea5 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
        tea_sub1 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea5)
        cus_sub1 = CustomerSubscription.create(customer_id: cus1.id , subscription_id: sub1.id , status: "Cancelled")
        cus_sub2 = CustomerSubscription.create(customer_id: cus1.id , subscription_id: sub2.id , status: "Active")

        expect(cus1.all_subscriptions).to eq [sub1, sub2]
        expect(cus1.all_subscriptions.count).to eq 2
      end
    end
  end
end