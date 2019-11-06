module PedidosHelper
  def contagem_pedido_acima_de_1
    pedido_possui_items if pedido_possui_items > 0
  end

  def pedido_possui_items
    if @current
      total = @current.items.map(&:quantidade).sum
      total if total > 0
    end
  end

  def criando?
    @pedido.status == 'criando'
  end

  def cancelar?
    @pedido.status == 'efetuado' || @pedido.status == 'aprovado'
  end

  def aceitar?
    current_usuario.try(:admin) && @pedido.status == 'efetuado'
  end

  def finalizar?
    current_usuario.try(:admin) && @pedido.status == 'aprovado'
  end

  def refazer?
    @pedido.status == 'cancelado'
  end
end
