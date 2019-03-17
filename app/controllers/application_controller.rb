# frozen_string_literal: true

# myclass
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, :set_locale

  include SessionHelper

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def require_login
    unless signed_in?
      flash[:danger] = 'Вы должны войти'
      redirect_to session_login_path
    end
  end
end
