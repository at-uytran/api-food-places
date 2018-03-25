class Api::V1::UsersController < ApplicationController
  before_action :load_user, only: %i(show update)

  def index
    @users = User.all
    render json: {users: @users}
  end

  def show; end

  def new; end

  def update
    @user.update_attributes :user_params
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params(:user).permit :id, :name, :email, :password, :password_confirmation
  end
end
