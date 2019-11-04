class Pedido < ApplicationRecord
  has_many :items, dependent: :destroy

  def add_produto(produto)
    item_atual = items.find_by(produto_id: produto.id)

    if item_atual
      item_atual.increment(:quantidade)
    else
      item_atual = items.build(produto_id: produto.id)
    end
    item_atual
  end

  def preco_total
    items.to_a.sum { |item| item.preco_total }
  end
end
