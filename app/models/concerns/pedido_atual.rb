module PedidoAtual
  private

  def set_pedido
    @current = Pedido.find(session[:current_pedido_id])
    if @current.status == 'efetuado'
      new_pedido
    end
  rescue ActiveRecord::RecordNotFound
    new_pedido
  end

  def new_pedido
    @current = Pedido.create
    session[:current_pedido_id] = @current.id
  end
end