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

  def render_success data={}
    render json: {
      error: 0,
      data: data
    }
  end

  def current_user
    # todo
  end

end
