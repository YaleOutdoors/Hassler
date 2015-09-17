class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  before_action :authenticate

  def authenticate
    token = request.headers["hassler-access-token"]
    if token.nil?
      render_error("Hassler access token not valid", 401)
    end
    @current_user = Token.authenticate_user(token)
    if @current_user.nil?
      render_error("Hassler access token not valid", 401)
    end
  end

  def render_error(msg, code)
    render json: {
      message: msg
    },
    status: code,
    success: false
  end

  def render_success data={}
    render json: {
      data: data
    }
  end

end
