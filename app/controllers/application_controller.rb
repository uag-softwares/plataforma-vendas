class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include PedidoAtual
  before_action :set_pedido

  alias current_user current_usuario

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  def response_unsuccessfully(format, method, model, status)
    format.html { render method, status: status }
    format.json { render json: model.errors, status: status }
  end

  def response_successfully(format, redirect, msg, method, status)
    format.html { redirect_to redirect, notice: msg }
    format.json { render method, status: status, location: redirect }
  end
end
