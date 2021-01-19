class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :destroy, :update]

  def index 
    # send all of the subscriptions back
    subscriptions = Subscription.all
    render json: subscriptions
  end

  def show 
    # send one subscription back
    render json:  @subscription
  end

  def create 
    # create a new subscription
    subscription = Subscription.new(subscriptions_params)
    subscription.capitalize_name
    if subscription.save
      render status: :created 
    else
      render status: :bad_request
    end
  end

  def update 
    # updating one subscription
    if @subscription.update(subscriptions_params)
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  def destroy 
    @subscription.destroy
  end

  private 

  def set_subscription 
    @subscription = Subscription.find(params[:id])
  end
  
  def subscriptions_params 
    # strong params
    params.require(:subscription).permit(:name, :price_per_month, :billing_period)
  end
end
