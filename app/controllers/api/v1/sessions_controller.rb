class Api::V1::SessionsController < ApplicationController
  def create
    debugger
  end

  def destroy

  end

  private

  def load_user
    @user = User.find_by email: params[:email].downcase
  end
end
