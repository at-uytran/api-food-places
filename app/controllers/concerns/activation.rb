module Activation
  # def actived?
  #   confirm_token = params[:id]
  #   confirm_token_nil if confirm_token.nil?
  #   user? confirm_token unless confirm_token.nil?
  # end

  # private

  # def confirm_token_nil
  #   render json: { message: I18n.t('controller.activations.expired') }, status: :unauthorized
  # end

  # def user?(confirm_token)
  #   @actor = User.find_by(confirm_digest: confirm_token)
  #   render json: { message: I18n.t('controller.session.expired') }, status: :unauthorized if @actor.nil?
  #   expired? unless @actor.nil?
  # end

  # def expired?
  #   render json: { message: I18n.t('controller.activations.expired') }, status: :unauthorized if @actor.confirm_expire_at < DateTime.now
  # end
end
