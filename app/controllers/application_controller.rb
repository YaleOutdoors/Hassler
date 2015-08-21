class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  def render_error msg
    render json: {
      error: 1,
      message: msg
    }
  end
end
