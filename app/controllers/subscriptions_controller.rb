class SubscriptionsController < ApplicationController
  def index 
    # send all of the subscriptions back
    subscriptions = Subscription.all
    render json: subscriptions
  end

  def show 
    # send one subscription back
    subscription = Subscription.find(params[:id])
    render json: subscription
  end

  def create 
    # create a new subscription
    subscription = Subscription.new(subscriptions_params)
    if subscription.save
      render status: :created 
    else
      render status: :bad_request
    end
  end

  # strong params

  private 

  def subscriptions_params 
    params.require(:subscription).permit(:name, :price_per_month, :billing_period)
  end
end
