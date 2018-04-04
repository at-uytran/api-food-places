module Authenticate
  def authenticated?
    auth_token = request.headers["Authorization"]
    auth_token_nil if auth_token.nil?
    current_user? auth_token unless auth_token.nil?
  end

  private

  def auth_token_nil
    render json: {message: I18n.t("controller.session.access")}, status: :unauthorized
  end

  def current_user?(auth_token)
    @actor = User.find_by(auth_digest: auth_token)
    render json: {message: I18n.t("controller.session.access")}, status: :unauthorized if @actor.nil?
  end
end
