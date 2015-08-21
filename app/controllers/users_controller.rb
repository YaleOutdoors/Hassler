class UsersController < ActionController::Base
  before_action :find_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all.to_json
    render json: @users
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
