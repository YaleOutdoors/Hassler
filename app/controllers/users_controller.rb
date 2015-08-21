class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = Users.all.to_json
    render @users
  end

  def show
    render json: @user
  end

  def edit
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
