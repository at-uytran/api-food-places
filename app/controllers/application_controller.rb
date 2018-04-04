class ApplicationController < ActionController::API
  include Authenticate
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def create_serialize obj
    ActiveModelSerializers::SerializableResource.new obj if obj
  end
end
