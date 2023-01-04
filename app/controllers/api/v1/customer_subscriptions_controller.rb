class Api::V1::CustomerSubscriptionsController < ApplicationController

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
      if cus_sub.update(cus_sub_params)
        render json: CustomerSubscriptionSerializer.new(cus_sub), status: 202
      else
        render json: { error: 'Unsuccessful update' }, status: 404
      end
    else
      render json: { error: 'No Customer Subscription found' }, status: 404
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