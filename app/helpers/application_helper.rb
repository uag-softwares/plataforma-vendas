module ApplicationHelper
  def contagem_pedido_acima_de_1
    pedido_possui_items if pedido_possui_items > 0
  end

  def pedido_possui_items
    total = @pedido.items.map(&:quantidade).sum
    total if total > 0
  end
end
