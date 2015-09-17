class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy, :update]

  CLIENT_ID = '584319657310-q4rpinvp1b41shkj889u5q3sf5uiccv7.apps.googleusercontent.com'

  def login
    # POST /login
    token = params[:idtoken]
    validator = GoogleIDToken::Validator.new
    jwt = validator.check(token, CLIENT_ID)
    if jwt
      # access_token = Token.generate_for()
      render_success jwt
    else
      render_error("Cannot validate: #{validator.problem}", 401)
    end

  end


  def index
    @users = User.all.to_json
    render_success @users
  end

  def show
    render_success @user
  end

  def create
    # POST with params
    @user = User.new(user_params)
    if @user.save
      render_success @user
    else
      render_error("user creation failed", 500)
    end
  end

  def update
  end

  def destroy
    @user.destroy
    render_success
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:name, :email, :role, :affiliation)
  end
end
