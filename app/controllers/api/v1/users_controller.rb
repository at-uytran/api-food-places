module Api
  module V1
    class UsersController < ApplicationController
      before_action :load_user, only: %i(show update)

      def index
        @users = User.all
        @users = create_serialize @users
        render json: {message: "", data: {users: @users}}, status: 200
      end

      def show
        @user = create_serialize @user
        render json: {message: "", data: {user: @user}}, status: :ok
      end

      def new
        @user = User.new user_params
      end

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
  end
end
