class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Método de autorização para administradores
  private

  def authorize_admin!
    unless admin_signed_in?
      redirect_to root_path, alert: "Você não tem permissão para realizar essa ação."
    end
  end
end
