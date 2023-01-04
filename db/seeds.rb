# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sub_status = ["Active", "Inactive"]
cus_sub_status = ["Active", "Cancelled"]
freq = ["1", "30", "90", "365"]

# Customers
cus1 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
cus2 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)
cus3 = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, address: Faker::Address.full_address)

# Subscriptions
sub1 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: sub_status.sample, frequency: freq.sample)
sub2 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: sub_status.sample, frequency: freq.sample)
sub3 = Subscription.create(title: Faker::Emotion.adjective, price: Faker::Number.number(digits: 4), status: sub_status.sample, frequency: freq.sample)

# Teas
tea1 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
tea2 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
tea3 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
tea4 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))
tea5 = Tea.create(title: Faker::Tea.variety, description: Faker::Lorem.paragraph, temperature: Faker::Number.between(from: 140, to: 212), brew_time: Faker::Number.between(from: 180, to: 300 ))

# Subscription_Teas
tea_sub1 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea5)
tea_sub2 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea4)
tea_sub3 = SubscriptionTea.create(subscription_id: sub1.id, tea_id: tea3)

tea_sub4 = SubscriptionTea.create(subscription_id: sub2.id, tea_id: tea2)
tea_sub5 = SubscriptionTea.create(subscription_id: sub2.id, tea_id: tea1)
tea_sub6 = SubscriptionTea.create(subscription_id: sub2.id, tea_id: tea5)

tea_sub7 = SubscriptionTea.create(subscription_id: sub3.id, tea_id: tea2)
tea_sub8 = SubscriptionTea.create(subscription_id: sub3.id, tea_id: tea4)

# Customer_Subscriptions
cus_sub1 = CustomerSubscription.create(customer_id: cus1.id , subscription_id: sub1.id , status: cus_sub_status.sample)
cus_sub2 = CustomerSubscription.create(customer_id: cus1.id , subscription_id: sub1.id , status: cus_sub_status.sample)

cus_sub3 = CustomerSubscription.create(customer_id: cus2.id , subscription_id: sub2.id , status: cus_sub_status.sample)
cus_sub4 = CustomerSubscription.create(customer_id: cus2.id , subscription_id: sub1.id , status: cus_sub_status.sample)

cus_sub5 = CustomerSubscription.create(customer_id: cus3.id , subscription_id: sub2.id , status: cus_sub_status.sample)
cus_sub6 = CustomerSubscription.create(customer_id: cus3.id , subscription_id: sub3.id , status: cus_sub_status.sample)