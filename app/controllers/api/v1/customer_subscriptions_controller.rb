class Api::V1::CustomerSubscriptionsController < ApplicationController

  def create
    cus_sub = CustomerSubscription.new(cus_sub_params)
    if cus_sub.save
      render json: CustomerSubscriptionSerializer.new(cus_sub), status: 201
    else
      render json: { error: 'Unsuccessful Creation' }, status: 404
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

end