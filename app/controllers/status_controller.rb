class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {message: "ok"}, status: :ok
  end

  def user
    render json: { current_user: current_user.email }
  end
end
