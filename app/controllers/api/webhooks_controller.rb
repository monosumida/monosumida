class Api::WebhooksController < Api::ApplicationController
  def create
    signature = request.headers['BowNow-Signature']
    token = request.headers['BowNow-Request-Token']
    timestamp = request.headers['BowNow-Timestamp']
    api_key = '2cdd09505257d7d3bebe11c52f15a92a'
    Rails.logger.info('-----Request Body-----')
    Rails.logger.info(request.body)
    Rails.logger.info(request.body.read)
    Rails.logger.info('-----Request Body-----')
    signed = Digest::SHA256.hexdigest("#{api_key}:#{timestamp}:#{token}:#{request.body.read}")
    calced_headers = Base64.urlsafe_encode64(signed)
    render json: {
      result: request.body.read,
      timestamp: timestamp,
      plain_signature: signature,
      calc__signature: calced_headers
    }, status: :ok
  end
end
