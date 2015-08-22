class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds
  include ActionController::StrongParameters

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

  def current_user
    # todo
  end

end
