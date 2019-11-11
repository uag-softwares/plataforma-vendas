module PedidoAtual
  private

  def set_pedido
    if current_usuario
      @current = Pedido.find(session[:current_pedido_id])
      if @current.status == 'efetuado'
        new_pedido
      end
    end
  rescue ActiveRecord::RecordNotFound
    new_pedido
  end

  def new_pedido
    @current = Pedido.create(usuario: current_usuario)
    session[:current_pedido_id] = @current.id
  end
end