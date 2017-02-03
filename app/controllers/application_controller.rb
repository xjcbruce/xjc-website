class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # For ActiveAdmin / Cancan
  def current_ability
    if request.fullpath =~ /\/admin/
      @current_ability ||= AdminAbility.new(current_admin_user)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end

  def admin_access_denied(exception)
    redirect_to admin_denied_page_path, alert: exception.message
  end

end
