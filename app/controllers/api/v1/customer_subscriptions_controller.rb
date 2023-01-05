class Api::V1::CustomerSubscriptionsController < ApplicationController
  before_action :find_customer, only: [:index]
  def index
    subscriptions = @customer.all_subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def create
    cus_sub = CustomerSubscription.new(cus_sub_params)
    if cus_sub.save
      render json: CustomerSubscriptionSerializer.new(cus_sub), status: 201
    else
      render json: { error: 'Unsuccessful Creation' }, status: 404
    end
  end

  def update
    if CustomerSubscription.exists?(params[:id])
      cus_sub = CustomerSubscription.find(params[:id])
      begin
        cus_sub.update(cus_sub_params)
        render json: CustomerSubscriptionSerializer.new(cus_sub), status: 202
      rescue ArgumentError
        render json: { error: "Incorrect Datatype: Status Must Be 'Active' or 'Cancelled'" }, status: 404
      end
    else
      render json: { error: 'No Customer Subscription found' }, status: 404
    end
  end

  def destroy
    if CustomerSubscription.exists?(params[:id])
      CustomerSubscription.destroy(params[:id])
    else
      render json: { error: 'No customer subscription found' }, status: 404
    end
  end

  private

  def cus_sub_params
    if params.has_key?(:customer_subscription)
      params.require(:customer_subscription).permit(:customer_id, :subscription_id, :status)
    else
      params.permit(:customer_id, :subscription_id, :status)
    end
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end