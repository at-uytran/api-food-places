module Api
  module V1
    class SessionsController < ApplicationController
      before_action :authenticated?, only: %i(destroy update)
      before_action :params_nil?, only: %i(create)

      def create
        user = User.find_by email: params[:email]
        if user && user.authenticate(params[:password])
          user.update_auth_token
          response.set_header("Authorization", user.auth_digest)
          render json: user, status: :ok
        else
          render json: {message: ".invalid"}, status: :unauthorized
        end
      end

      def update
        @actor.update_auth_token
        response.headers["Authorization"] = @actor.auth_digest
        render json: @actor
      end

      def destroy
        @actor.remove_auth_token
        render json: {message: I18n.t(".success")}, status: :ok
      end

      private

      def user_params
        params.permit(:email, :password, :remember)
      end

      def params_nil?
        render json: {message: I18n.t("sessions.params_nil")}, status: :unprocessable_entity unless
          user_params[:email] && user_params[:password]
      end
    end
  end
end
