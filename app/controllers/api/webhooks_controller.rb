class Api::WebhooksController < Api::ApplicationController
  def create
    render json: { result: params }, status: :ok
  end
end
