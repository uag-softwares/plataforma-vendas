class Item < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido

  def preco_total
    produto.preco * quantidade
  end
end
