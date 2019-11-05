class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PedidoAtual
  before_action :set_pedido
  alias_method :current_user, :current_usuario
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end
end
