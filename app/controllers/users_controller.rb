class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy, :update]

  def index
    @users = User.all.to_json
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    binding.pry
    # POST with params
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render_error "user_creation_failed"
    end
  end

  def update
  end

  def destroy
    @user.destroy
    # what to return here?
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:name, :email, :role, :description, :affiliation)
  end
end
