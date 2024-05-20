include ActionController::MimeResponds

class ApplicationController < ActionController::API
    respond_to :json
    before_action :log_request_body, :authenticate_user!

  private

  def log_request_body
    Rails.logger.info "Request Body: #{request.body.read}"
    request.body.rewind # Rewind the body after reading to ensure it's still available for other operations
  end
end
