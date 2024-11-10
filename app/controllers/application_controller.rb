class ApplicationController < ActionController::Base
  
  #Permitir apenas navegadores modernos que suportem imagens webp, web push, emblemas, mapas de importação, aninhamento de CSS e CSS :has.
  allow_browser versions: :modern

  # Método de autorização para administradores
  private

  def authorize_admin!
    unless admin_signed_in?
      redirect_to root_path, alert: "Você não tem permissão para realizar essa ação."
    end
  end
end
