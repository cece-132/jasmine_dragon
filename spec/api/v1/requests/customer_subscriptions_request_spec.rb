# Create a customer subscription
  # An endpoint to subscribe a customer to a tea subscription

# Destroy a customer subscription
  # An endpoint to cancel a customer’s tea subscription

# Read all the customers subscriptions
  # An endpoint to see all of a customer’s subsciptions (active and cancelled)

require 'rails_helper'

RSpec.describe "Customer Subscriptions" do
  describe 'create' do
    it 'can create an customer subscription' do

      cus1 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
      sub1 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: "Active", frequency: "30")
      tea5 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
      tea_sub1 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea5)

      cus_sub_params = ( {
        customer_id: cus1.id,
        subscription_id: sub1.id,
        status: "Active"
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/customer_subscription", headers: headers, params: JSON.generate(customer_subscription: cus_sub_params)

      expect(response).to be_successful

      cus_sub = JSON.parse(response.body, symbolize_names: true)

      expect(cus_sub).to be_a Hash
      expect(cus_sub).to have_key(:data)
      expect(cus_sub[:data]).to have_key(:id)
      expect(cus_sub[:data]).to have_key(:type)
      expect(cus_sub[:data]).to have_key(:attributes)
      expect(cus_sub[:data][:attributes]).to have_key(:customer_id)
      expect(cus_sub[:data][:attributes]).to have_key(:subscription_id)
      expect(cus_sub[:data][:attributes]).to have_key(:status)

      result = CustomerSubscription.last
      expect(result.customer.id).to eq(cus1.id)
    end

    it 'returns 404 if missing data' do
      cus1 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
      sub1 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: "Active", frequency: "30")
      tea5 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
      tea_sub1 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea5)

      cus_sub_params = ( {
        customer_id: cus1.id,
        # subscription_id: sub1.id,
        status: "Active"
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/customer_subscription", headers: headers, params: JSON.generate(customer_subscription: cus_sub_params)

      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:error]).to eq('Unsuccessful Creation' )

      expect(error_response).to be_a Hash
      expect(error_response).to have_key(:error)

      result = CustomerSubscription.all.length
      expect(result).to eq(0)
    end
  end

  describe 'Update' do
    it 'can update and item' do
      cus1 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
      sub1 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: "Active", frequency: "30")
      tea5 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
      tea_sub1 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea5)
      cus_sub1 = CustomerSubscription.create(customer_id: cus1.id , subscription_id: sub1.id , status: "Active")

      previous_status = CustomerSubscription.last.status
      
      cus_sub_params = { status: "Cancelled" }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/customer_subscription/#{cus_sub1.id}", headers: headers, params: JSON.generate(customer_subscription: cus_sub_params)

      cus_sub = JSON.parse(response.body, symbolize_names: true)
      updated_cus_sub = CustomerSubscription.last
      
      expect(response).to be_successful
      expect(updated_cus_sub.status).to_not eq status
      expect(updated_cus_sub.status).to eq "Cancelled"
    end

  end
end