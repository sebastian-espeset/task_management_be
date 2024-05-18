include ActionController::MimeResponds

class ApplicationController < ActionController::API
    respond_to :json
end
