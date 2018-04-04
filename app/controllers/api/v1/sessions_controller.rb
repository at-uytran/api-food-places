module Api
  module V1
    class SessionsController < ApplicationController
      before_action :authenticated?, only: %i(destroy update create)
      before_action :load_user, only: %i(destroy)

      def create
        @user = User.find_by email: params[:email]
      end

      def destroy; end

      private

      def user_params
        params.permit(:email, :password, :remember)
      end

      def load_user
        @user = User.find_by email: params[:email].downcase
      end
    end
  end
end
